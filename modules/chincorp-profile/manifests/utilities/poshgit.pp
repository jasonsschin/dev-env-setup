class chincorp-profile::utilities::poshgit () inherits chincorp-profile::global_variables {

    package { "poshgit":
        ensure => installed,
        provider => chocolatey,
    }
}
