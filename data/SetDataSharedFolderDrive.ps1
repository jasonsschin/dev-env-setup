﻿Write-Host "SetDataSharedFolderDrive script" 
Write-Debug "Checking CDRom drive letter..."

$cdRomDrive = [System.IO.DriveInfo]::getdrives() | ?  {$_.DriveType -eq "CDRom"} | Select-Object Name -First 1 | select -ExpandProperty "Name"

Write-Debug "CDRom: $cdRomDrive"

Write-Debug "Checking E: drive letter is in use..."
$e = [System.IO.DriveInfo]::getdrives() | ?  {$_.Name -eq "e:\"} 

if ($e -eq $null){
    Write-Debug "Mounting CDRom drive as E: ..."
    (gwmi Win32_cdromdrive).drive | %{$a = mountvol $_ /l;mountvol $_ /d;$a = $a.Trim();mountvol e: $a}
}
<#
Write-Debug "Checking D: drive letter is in use..."
$d = [System.IO.DriveInfo]::getdrives() | ?  {$_.Name -eq "d:\"} 

if ($d -eq $null){
    Write-Debug "Mounting Data drive as G: ..."
    New-PSDrive –Name “D” –PSProvider FileSystem –Root “\\psf\Data” –Persist
}
#>