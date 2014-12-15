class chincorp-profile::applications::sublimetext2 () inherits chincorp-profile::global_variables {

    package { "sublimetext2":
        ensure => installed,
        provider => chocolatey,
    }
}
