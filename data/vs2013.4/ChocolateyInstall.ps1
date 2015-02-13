try {

    Write-Host "Copying file Visual Studio Update 4 file to c:\tmp ..."

    $softwareDir = "C:\vagrant_data\vs2013.4\"
    $workingDir = "C:\tmp"
    $iso = "vs2013.4.iso"
    $installSoftwarePath = Join-Path $softwareDir $iso
    $workingSoftwarePath = Join-Path $workingDir $iso

    Copy-Item $installSoftwarePath $workingDir

    Write-Host "Mounting Visual Studio Update 4 iso ..."

    $setupDriveLetter = (Mount-DiskImage -ImagePath C:\tmp\vs2013.4.iso -PassThru | Get-Volume).DriveLetter + ":"

    $installPath = Join-Path $setupDriveLetter VS2013.4.exe

    Write-Host "Installing Visual Studio Update 4..."

    Install-ChocolateyInstallPackage `
	    'VS2013.4.exe' 'exe' "/Passive /NoRestart /Log $($env:temp)\VS20134.log" `
	    "file:/$installPath" -validExitCodes @(0,3010, -2147185721)

    Write-Host "Visual Studio Update 4 cleanup ..."

    Dismount-DiskImage $workingSoftwarePath

    Remove-Item $workingSoftwarePath

    Write-ChocolateySuccess $packageName    

} catch {
    Write-ChocolateyFailure $packageName $($_.Exception.Message)
    throw $_.Exception
}


