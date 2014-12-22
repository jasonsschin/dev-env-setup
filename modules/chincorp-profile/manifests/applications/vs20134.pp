class chincorp-profile::applications::vs20134 () inherits chincorp-profile::global_variables {

    package { "vs2013.4":
        ensure => installed,
        provider => chocolatey,
        source => 'C:\vagrant_data\vs2013.4'
    }
}
