#This script gets the passmark score of your PC's PRocessors by Webscraping

#get proccessor name
$cpuname = (Get-computerInfo).CsProcessors.Name 

#get web page for processor name
$request = Invoke-WebRequest -Method GET -Uri 'https://www.cpubenchmark.net/cpu.php' -Body @{'cpu'="$cpuname"}

#Find exact element that is formated as specified which is score
$element = $request.ParsedHtml.getElementsByTagName('span') | where-object {$_.outerHTML -like '<SPAN style="FONT-SIZE: 44px; FONT-FAMILY: Arial, Helvetica, sans-serif; FONT-WEIGHT: bold; COLOR: #f48a18">*</SPAN>'}

#get Score Number from element selected
$score = $element.innerHTML

#set Textfile contents to score
Set-Content -Path C:\temp\cpuscore.txt -Value $score
