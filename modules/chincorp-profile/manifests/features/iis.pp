class chincorp-profile::features::iis () inherits chincorp-profile::global_variables {

	dism { 'IIS-WebServerRole':
	  ensure => present,
	}

	dism { 'IIS-WebServer':
	  ensure  => present,
	  require => Dism['IIS-WebServerRole'],
	}
}


