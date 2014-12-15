class chincorp-profile::applications::p4merge () inherits chincorp-profile::global_variables {

    package { "p4merge":
        ensure => installed,
        provider => chocolatey,
    }
}
