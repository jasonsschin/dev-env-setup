
Write-Host "Copying file Visual Studio Update 4 file to c:\tmp ..."

Copy-Item C:\vagrant_data\vs2013.4.iso C:\tmp


Write-Host "Mounting Visual Studio Update 4 iso ..."

$setupDriveLetter = (Mount-DiskImage -ImagePath C:\tmp\vs2013.4.iso -PassThru | Get-Volume).DriveLetter + ":"

$installPath = Join-Path $setupDriveLetter VS2013.4.exe

Write-Host "Installing Visual Studio Update 4..."

Install-ChocolateyPackage `
	'VS2013.4.exe' 'exe' "/Passive /NoRestart /Log $($env:temp)\VS20134.log" `
	"file:/$installPath" -validExitCodes @(0,3010)


Write-Host "Visual Studio Update 4 cleanup ..."

Dismount-DiskImage c:\tmp\vs2013.4.iso

Start-sleep 1

Remove-Item  C:\tmp\vs2013.4.iso