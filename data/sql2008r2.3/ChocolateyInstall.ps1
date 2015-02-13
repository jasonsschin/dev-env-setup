try {
    Write-Debug "Gathering installation information ..."

    $chocolateyPackageInstallPath = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)" 

    $osBitness = Get-ProcessorBits

    $softwareDir = "c:\vagrant_data\sql2008r2.3"
    $workingDir = "C:\tmp\"
    $iso = "en_sql_server_2008_r2_service_pack_3_x86_x64_dvd_5599878.iso"

    $sqlSetupExecutableName =  "SQLServer2008R2SP3-KB2979597-x86-ENU.exe"
    $sqlSetupExecutableName64 =  "SQLServer2008R2SP3-KB2979597-x64-ENU.exe"

    $installIsoPath = Join-Path $workingDir $iso
    $installSoftwarePath = Join-Path $softwareDir $iso

    Copy-Item $installSoftwarePath $installIsoPath

    Write-Debug "Mounting SQL 2008 R2 Update 3 iso ..."

    $isoMountDrive = (Mount-DiskImage -ImagePath $installIsoPath -PassThru | Get-Volume).DriveLetter + ":"

    $setupFilePath = Join-Path  $isoMountDrive $sqlSetupExecutableName

    Write-Debug "SQL Setup file path: $setupFilePath"

    if ($osBitness -eq 64) {
	    Write-Debug "64 bit proccessor detected"
	    $setupFilePath = Join-Path  $isoMountDrive $sqlSetupExecutableName64
    }

    Write-Host "Installing SQL 2008 R2 Update 3..." -ForegroundColor Green

    Install-ChocolateyInstallPackage `
        'SQLServer2008R2SP3' 'exe' '/qs /IAcceptSQLServerLicenseTerms /Action=Patch /AllInstances' `
	     "file://$setupFilePath"  -validExitCodes @(0,3010)

    Write-Debug "SQL 2008 R2 installation cleanup ..."

    Dismount-DiskImage $installIsoPath

    Start-sleep 1

    Remove-Item  $installIsoPath

    Write-ChocolateySuccess $packageName    

} catch {
    Write-ChocolateyFailure $packageName $($_.Exception.Message)
    throw $_.Exception
}
