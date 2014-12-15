# == Class: chincorp-dev
#
# Full description of class dev here.
#
# === Parameters
#
# Document parameters here.
#
# [*sample_parameter*]
#   Explanation of what this parameter affects and what it defaults to.
#   e.g. "Specify one or more upstream ntp servers as an array."
#
# === Variables
#
# Here you should define a list of variables that this module would require.
#
# [*sample_variable*]
#   Explanation of how this variable affects the funtion of this class and if
#   it has a default. e.g. "The parameter enc_ntp_servers must be set by the
#   External Node Classifier as a comma separated list of hostnames." (Note,
#   global variables should be avoided in favor of class parameters as
#   of Puppet 2.6.)
#
# === Examples
#
#  class { 'dev':
#    servers => [ 'pool.ntp.org', 'ntp.local.company.com' ],
#  }
#
# === Authors
#
# Author Name <author@domain.com>
#
# === Copyright
#
# Copyright 2014 Your name here, unless otherwise noted.
#
class chincorp-dev {

    #package, file, service is a standard pattern

    exec { 'change_cdrom_mapping':
      command   => '. c:\vagrant_data\change_cdrom_mapping.ps1 --debug',
      provider  => powershell,
      logoutput => true
    }

    $template = "netrc.erb"

    file { 'netrc':
      ensure  => 'present',
      path => "c:\\users\\vagrant\\_netrc",
      content => template('chincorp-dev/_netrc.erb')
    }

    file { 'gitconfig':
      ensure  => 'present',
      path => "c:\\users\\vagrant\\.gitconfig",
      content => template('chincorp-dev/gitconfig.erb')
    }

}
