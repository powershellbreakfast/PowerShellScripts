#A simple Script to create local Admin account with no password

$localadmin = "Admin"
$localadminpassword = ConvertTo-SecureString 'your_password' -AsPlainText -Force


#check for admin account
Write-Host "Checking for Admin"
$adminexist = (Get-LocalUser -Name $localadmin).Enabled

if($adminexist -ne $true){
#create admin local account
Write-Host "$localadmin Does not Exist. Creating" 
New-LocalUser -Name $localadmin -Description "local admin account for scripts and admin stuff" -Password $localadminpassword
Write-Host "$localadmin Created"
Add-LocalGroupMember -Name 'Administrators' -Member $localadmin
Write-Host "$localadmin added to Administrators"
}
else{
Write-Host "$localadmin Already Exists"
}
