# == Class: activemq
#
# Full description of class activemq here.
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
#  class { 'activemq':
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
class chincorp-activemq {

	$webconsole_enable_http = false
	$webconsole_enable_https = true

    package { 'activemq':
        ensure => installed,
        provider => chocolatey,
    }
 
   	exec { 'backup_original_jetty':
      command   => 'Copy-Item C:\bin\ActiveMQ\apache-activemq-5.10.0\conf\jetty.xml c:\bin\ActiveMQ\apache-activemq-5.10.0\conf\jetty.xml.original',
      onlyif 	=> '!(Test-Path C:\bin\ActiveMQ\apache-activemq-5.10.0\conf\jetty.xml.original)',
      provider  => powershell,
      logoutput => true
    }

    file { 'jetty':
    	path => 'C:\bin\ActiveMQ\apache-activemq-5.10.0\conf\jetty.xml',
    	ensure => 'present',
    	require => Package['activemq'],
    	content => template('chincorp-activemq/jetty.xml.erb')
    }
}
