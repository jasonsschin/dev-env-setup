class chincorp-profile::applications::visualstudio2013ultimate () inherits chincorp-profile::global_variables {

    package { "visualstudio2013ultimate":
        ensure => installed,
        provider => chocolatey,
        source => 'C:\vagrant_data\vs2013'
    }

    package { "vs2013.4":
        ensure => installed,
        provider => chocolatey,
        source => 'C:\vagrant_data\vs2013.4',
        require => Package['visualstudio2013ultimate'],
    }
}
