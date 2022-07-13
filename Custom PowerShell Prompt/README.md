# Custom PowerShell Prompt

## Go from a boring prompt like this
![image](https://user-images.githubusercontent.com/58199755/178761559-ea4fea3f-8066-4fec-9982-e51406504741.png)

## To a more informative prompt like this
![image](https://user-images.githubusercontent.com/58199755/178761427-ab10b3d6-797b-4655-9664-db92bb02a4e2.png)

## How to install
To install you just have to replace the profile file for your user account and the version of powershell you are running.

To get the path of the profile in use by your current terminal, simply output the $PROFILE variable

```powershell
Write-Host $PROFILE
```

The output of the command should be a path like:
C:\Users\<username>\Documents\WindowsPowerShell\Microsoft.PowerShell_profile.ps1

Just replace the file and relaunch powershell and your done.

```powershell
Copy-Item PowerShell_profile.ps1 $PROFILE
```


## Features
- Shows Execution time of last command.
- Shows user terminal is running as.
- Shows if terminal was launched as admin.
- its colorful
