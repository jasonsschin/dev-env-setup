Package {
  provider => chocolatey
}

# ensure that my user is present and an Admin (maybe with a different pwd)
/*
user { $hostuser : # look in VagrantFile, this is set to the user running the host; clever eh?
  ensure => "present",
  groups => ["Administrators"],
  password => "password"
}
*/

exec { 'change_cdrom_mapping':
  command   => '. c:\vagrant_data\change_cdrom_mapping.ps1 --debug',
  provider  => powershell,
  logoutput => true
}
$template = "${hostname}.txt.erb"

file { 'some_random_text':
  ensure  => 'present',
  path => "c:\\$hostname.txt",
  content => template("${template}")
}

/*
package { "boxstarter" :
  ensure => "installed"
}

package { "fiddler4" :
  ensure => "latest"
}

package { "DotNet3.5" :
  ensure => "installed"
}

package { "git" :
  ensure => "installed"
}

package { "poshgit" :
  ensure => "installed"
}

package { "git-credential-winstore" :
  ensure => "installed"
}

package { "Cmder" :
  ensure => "installed"
}

package { "sublimetext2" :
  ensure => "installed"
}

package { "linqpad4" :
  ensure => "installed"
}

package { "webpi" :
  ensure => "installed"
}

package { "dotpeek" :
  ensure => "installed"
}

package { "ruby" :
  ensure => "installed"
}

package { "ruby.devkit" :
  ensure => "installed"
}

package { "googlechrome" :
  ensure => "installed"
}

package { "adobereader" :
  ensure => "installed"
}

package { "sourcetree" :
  ensure => "installed"
}

package { "p4merge" :
  ensure => "installed"
}

package { "resharper" :
  ensure => "installed"
}

package { "windowsazurepowershell" :
  ensure => "installed"
}
*/
# ... other packages here...
