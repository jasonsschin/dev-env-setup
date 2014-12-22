Function Test-RegistryValue($regPath, $Key) {
    $exists = Get-ItemProperty -Path "$regPath" -Name "$Key" -ErrorAction SilentlyContinue
    If (($exists -ne $null) -and ($exists.Length -ne 0)) {
        Return $true
    }
    Return $false
}

$chocolateyPackageInstallPath = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)" 

$appCompatRegLocation = 'HKCU:\Software\Microsoft\Windows NT\CurrentVersion\AppCompatFlags'
$appCompatRegKey = '{22fbe76c-ce43-4588-9a1e-f09b342d6179}'
$appCompatRegValue = '4'

$sqlUnattendedConfigurationFile = Join-Path $chocolateyPackageInstallPath "ConfigurationFile.ini"

$sqlSetupExecutableName =  "setup.exe"
$softwareDir = "c:\vagrant_data\sql2008r2"
$workingDir = "C:\tmp\"
$iso = "en_sql_server_2008_r2_developer_x86_x64_ia64_dvd_522665.iso"

$installIsoPath = Join-Path $workingDir $iso
$installSoftwarePath = Join-Path $softwareDir $iso

$sqlDataPath = "D:\Microsoft SQL Server\MSSQL10_50.MSSQLSERVER\MSSQL\Data"
$sqlBackupPath = "D:\Microsoft SQL Server\MSSQL10_50.MSSQLSERVER\MSSQL\Backup"

if (!(Test-Path $sqlDataPath))
{
    Write-Debug "Creating sql data path: $sqlDataPath"
    New-Item -path  $sqlDataPath -type directory
}

if (!(Test-Path $sqlBackupPath))
{
    Write-Debug "Creating sql data backup: $sqlBackupPath"
    New-Item -path  $sqlBackupPath -type directory
}

Write-Debug "Chocolatey install path: $chocolateyPackageInstallPath"
Write-Debug "SQL Unattended Config file path: $sqlUnattendedConfigurationFile"

Copy-Item $installSoftwarePath $installIsoPath

Write-Debug "Mounting SQL 2008 R2 iso ..."

$isoMountDrive = (Mount-DiskImage -ImagePath $installIsoPath -PassThru | Get-Volume).DriveLetter + ":"

$setupFilePath = Join-Path  $isoMountDrive $sqlSetupExecutableName

Write-Debug "SQL Setup file path: $setupFilePath"

Write-Debug "Turn off application compatability checking for SQL 2008 R2..."

if ((Test-RegistryValue $appCompatRegLocation $appCompatRegKey) -eq $false){
    Write-Debug "Adding compatability registry value ..."
    Set-ItemProperty -Path $appCompatRegLocation -Name $appCompatRegKey -Value $appCompatRegValue -Type DWord
}

Write-Host "Installing SQL 2008 R2..." -ForegroundColor Green

Install-ChocolateyInstallPackage `
    'setup' 'exe'  "/ConfigurationFile=$sqlUnattendedConfigurationFile" `
	 "file://$setupFilePath"  -validExitCodes @(0,3010)

Write-Debug "SQL 2008 R2 installation cleanup ..."

Dismount-DiskImage C:\tmp\en_sql_server_2008_r2_developer_x86_x64_ia64_dvd_522665.iso

Start-sleep 1

Remove-Item   C:\tmp\en_sql_server_2008_r2_developer_x86_x64_ia64_dvd_522665.iso

