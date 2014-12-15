class chincorp-profile::applications::visualstudio2013ultimate () inherits chincorp-profile::global_variables {

    package { "cmder":
        ensure => installed,
        provider => chocolatey,
    }
}
