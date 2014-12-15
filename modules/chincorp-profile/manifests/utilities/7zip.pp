class chincorp-profile::utilities::7zip () inherits chincorp-profile::global_variables {

    package { "7zip":
        ensure => installed,
        provider => chocolatey,
    }
}
