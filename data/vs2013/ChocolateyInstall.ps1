try {

. (Join-Path $(Split-Path -parent $MyInvocation.MyCommand.Definition) 'common.ps1')

    $adminFile = (Join-Path $(Split-Path -parent $MyInvocation.MyCommand.Definition) 'AdminDeployment.xml')

    $customArgs = $env:chocolateyInstallArguments

    $env:chocolateyInstallArguments=""

    $settings = Initialize-VS-Settings $customArgs $adminFile

    $installerArgs = Get-VS-Installer-Args $settings.ProductKey

    Write-Host "Copying Visual Studio iso to windows temp ..."
    $softwareDir = "c:\vagrant_data\vs2013"
    $workingDir = "C:\Windows\Temp"
    $iso = "kopie-vs2013-ultimate-en.iso"
    $installSoftwarePath = Join-Path $softwareDir $iso

    Copy-Item $installSoftwarePath $workingDir

    Write-Host "Mounting Visual Studio iso ..."
    try
    {

    $driveLetter = (Mount-DiskImage C:\Windows\Temp\kopie-vs2013-ultimate-en.iso -PassThru | Get-Volume).DriveLetter + ":\"
    } catch [Exception] {
       Write-Host $_.Exception.Message
    }

       $installapp = Join-Path "$driveLetter" "vs_ultimate.exe"



    Write-Host "Installing Visual Studio 2013 ..."

    Install-ChocolateyInstallPackage 'VisualStudio2013Ultimate' 'exe' "/Log $($env:temp)\VS20134.log $installerArgs" "file://$installapp"  -validExitCodes @(0,3010, -2147185721)

    Write-Host "Cleaning up ..."

    Dismount-DiskImage  C:\Windows\Temp\kopie-vs2013-ultimate-en.iso

    Remove-Item  C:\Windows\Temp\kopie-vs2013-ultimate-en.iso
    
    Write-ChocolateySuccess $packageName

} catch {
    Write-ChocolateyFailure $packageName $($_.Exception.Message)
    throw $_.Exception
}