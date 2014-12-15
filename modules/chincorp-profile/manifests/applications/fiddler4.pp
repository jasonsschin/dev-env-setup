class chincorp-profile::applications::fiddler4 () inherits chincorp-profile::global_variables {

    package { "fiddler4":
        ensure => installed,
        provider => chocolatey,
    }
}
