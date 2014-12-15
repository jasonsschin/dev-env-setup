class chincorp-profile::applications::linqpad4 () inherits chincorp-profile::global_variables {

    package { "linqpad4":
        ensure => installed,
        provider => chocolatey,
    }
}
