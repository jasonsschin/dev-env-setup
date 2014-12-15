class chincorp-profile::applications::adobereader () inherits chincorp-profile::global_variables {

    package { "adobereader":
        ensure => installed,
        provider => chocolatey,
    }
}
