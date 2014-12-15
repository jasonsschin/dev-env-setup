class chincorp-profile::applications::cmder () inherits chincorp-profile::global_variables {

    package { "cmder":
        ensure => installed,
        provider => chocolatey,
    }
}
