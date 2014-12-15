. (Join-Path $(Split-Path -parent $MyInvocation.MyCommand.Definition) 'common.ps1')

$adminFile = (Join-Path $(Split-Path -parent $MyInvocation.MyCommand.Definition) 'AdminDeployment.xml')

$customArgs = $env:chocolateyInstallArguments

$env:chocolateyInstallArguments=""

$settings = Initialize-VS-Settings $customArgs $adminFile

$installerArgs = Get-VS-Installer-Args $settings.ProductKey

Write-Host "Copying Visual Studio iso to windows temp ..."

Copy-Item .\kopie-vs2013-ultimate-en.iso C:\Windows\Temp

Write-Host "Mounting Visual Studio iso ..."

$driveLetter = (Mount-DiskImage C:\Windows\Temp\kopie-vs2013-ultimate-en.iso -PassThru | Get-Volume).DriveLetter + ":\"

$installapp = Join-Path "$driveLetter" "vs_ultimate.exe"

Write-Host "Installing Visual Studio 2013 ..."

Install-ChocolateyPackage 'VisualStudio2013Ultimate' 'exe' $installerArgs "file://$installapp"

Write-Host "Cleaning up ..."

Dismount-DiskImage  C:\Windows\Temp\kopie-vs2013-ultimate-en.iso

Remove-Item  C:\Windows\Temp\kopie-vs2013-ultimate-en.iso