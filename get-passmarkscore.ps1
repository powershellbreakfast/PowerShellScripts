Start-Transcript -Force -Path C:\PowershellLogs\getpassmarkscore.log
#This script gets the passmark score of your PC's PRocessors by Webscraping

#get proccessor name
$cpuname = (Get-computerInfo).CsProcessors.Name 

#get web page for processor name
$request = Invoke-WebRequest -Method GET -Uri 'https://www.cpubenchmark.net/cpu.php' -UseBasicParsing -Body @{'cpu'="$cpuname"}

#Find exact element that is formated as specified which is score 
#regex MATCH 0-9 4 to unlimited times 
$request.Content -match 'value: [0-9]{4,},'

#get 1st match
$string = $Matches[0]

#get Score Number from element selected
$score = $string.Replace("value: ","").Replace(",","")

#set Textfile contents to score
Set-Content -Path C:\kworking\cpuscore.txt -Value $score

Write-Host $score

Stop-Transcript
