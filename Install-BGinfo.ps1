#Start Logging 
$logdir = 'C:\AzurePowershellLogs\'
$logfile = 'DeployBGinfo.txt'
$fulllogpath = $logdir+$logfile 
if($(test-path -Path $logdir)-eq $false){
$LogOutput = "Creating folder for log: $logdir"
New-Item -Path $logdir -ItemType Directory -ErrorAction Stop
}
else{
$LogOutput = "Folder already Exists: $logdir"
}
Start-Transcript -Path $fulllogpath
Write-Host $LogOutput


##DEPOLY BGINFO WITH CUSTOM CONFIG IN INTUNE

#HardCoded
$URL = "https://download.sysinternals.com/files/BGInfo.zip"
$BGIURL = "https://github.com/spicyfeast/mhc/raw/main/MHC.bgi"
$installfolder = "C:\BGinfo\"
$ZipDownload = "BGInfo.zip"
$BGICONFIG = "MHC.bgi"
$exe = "Bginfo.exe"
$InstallerPath = $installfolder + $ZipDownload
$BGIPATH = $installfolder + $BGICONFIG
$exepath = $installfolder + $exe

$bgInfoRegPath = "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Run"
$bgInfoRegkey = "BgInfo"
$bgInfoRegType = "String"
$bgInfoRegkeyValue = "$exepath $BGIPATH /timer:0 /nolicprompt"
$regKeyExists = (Get-Item $bgInfoRegPath -EA Ignore).Property -contains $bgInfoRegkey




#Check for Folder
Write-Output "Checking for folder $installfolder"
if (-not (Test-Path $installfolder)) {
        # Destination path does not exist, let's create it
        try {
            New-Item -Path $installfolder -ItemType Directory -ErrorAction Stop
            Write-Output "Created folder $installfolder"
        } catch {
            throw "Could not create path '$installfolder'!"
        }
    }
##DOWNLOAD BGInfo
Write-Output "Downloading $URL..."
Invoke-WebRequest -Uri $URL -OutFile $InstallerPath
Write-Output "Downloaded $InstallerPath"

##Download CONFIG
Write-Output "Downloading $BGIURL..."
Invoke-WebRequest -Uri $BGIURL -OutFile $BGIPATH
Write-Output "Downloaded $BGIPATH"


#EXTRACT
Write-Output "Unziping $InstallerPath to $installfolder"
Expand-Archive -LiteralPath $InstallerPath -DestinationPath $installfolder


#Create BgInfo Registry Key to AutoStart
If ($regKeyExists -eq $True){
Write-Host "Reg Key Already exists"
}Else{
Write-Host "Creating Reg Key"
New-ItemProperty -Path $bgInfoRegPath -Name $bgInfoRegkey -PropertyType $bgInfoRegType -Value $bgInfoRegkeyValue
}
 

## Run BgInfo
Write-Host "Running $exe"
C:\BGInfo\Bginfo.exe C:\BGInfo\MHC.bgi /timer:0 /nolicprompt /silent



Stop-Transcript
