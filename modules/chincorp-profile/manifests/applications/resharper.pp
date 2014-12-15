class chincorp-profile::applications::resharper () inherits chincorp-profile::global_variables {

    package { "resharper":
        ensure => installed,
        provider => chocolatey,
    }
}
