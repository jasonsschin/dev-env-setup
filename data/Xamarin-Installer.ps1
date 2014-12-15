Copy-Item C:\vagrant_data\XamarinInstaller.exe C:\tmp

$setupDriveLetter = (Mount-DiskImage -ImagePath c:\tmp\XamarinInstaller.exe -PassThru | Get-Volume).DriveLetter + ":"

Write-Host $setupDriveLetter
