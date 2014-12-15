Copy-Item C:\vagrant_data\sql\en_sql_server_2008_r2_developer_x86_x64_ia64_dvd_522665.iso C:\Windows\Temp


$setupDriveLetter = (Mount-DiskImage -ImagePath C:\Windows\Temp\en_sql_server_2008_r2_developer_x86_x64_ia64_dvd_522665.iso -PassThru | Get-Volume).DriveLetter + ":"

Write-Host $setupDriveLetter

cd  $setupDriveLetter

#./vs2013.4.exe /passive /noresart

Dismount-DiskImage  C:\Windows\Temp\en_sql_server_2008_r2_developer_x86_x64_ia64_dvd_522665.iso

Delete-Item  C:\Windows\Temp\en_sql_server_2008_r2_developer_x86_x64_ia64_dvd_522665.iso