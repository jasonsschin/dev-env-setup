$secpasswd = ConvertTo-SecureString "vagrant" -AsPlainText -Force
$mycreds = New-Object System.Management.Automation.PSCredential ("vagrant", $secpasswd)


#Write-Debug "Checking D: drive letter is in use..."
#$d = [System.IO.DriveInfo]::getdrives() | ?  {$_.Name -eq "D:\"} 

if (! (Test-Path "D:")){
Write-Host "Hi"
    Write-Debug "Mounting Data drive as D: ..."
    #New-PSDrive –Name D –PSProvider FileSystem –Root \\psf\Data –Persist -Credential $mycreds
    net use d: \\psf\data
}
