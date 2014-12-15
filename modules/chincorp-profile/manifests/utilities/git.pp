class chincorp-profile::utilities::git () inherits chincorp-profile::global_variables {

    package { "git":
        ensure => installed,
        provider => chocolatey,
    }
}
