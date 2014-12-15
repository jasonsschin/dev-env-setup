class chincorp-profile::applications::dotpeek () inherits chincorp-profile::global_variables {

    package { "dotpeek":
        ensure => installed,
        provider => chocolatey,
    }
}
