class chincorp-profile::utilities::boxstarter () inherits chincorp-profile::global_variables {

    package { "boxstarter":
        ensure => installed,
        provider => chocolatey,
    }
}
