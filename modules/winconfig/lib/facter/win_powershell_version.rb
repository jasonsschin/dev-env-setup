Facter.add("win_dotnet4_version") do
  confine :osfamily => "windows"
  
  ps_exec  = 'C:\Windows\system32\WindowsPowerShell\v1.0\powershell.exe'
  ps_cmd   = '($PSVersionTable.Version).Major'

  setcode do
    Facter::Util::Resolution.exec(%Q{#{ps_exec} -command #{ps_cmd}}).strip
  end
end
