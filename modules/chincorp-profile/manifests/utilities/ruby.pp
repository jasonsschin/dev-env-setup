class chincorp-profile::utilities::ruby () inherits chincorp-profile::global_variables {

    package { "ruby":
        ensure => installed,
        provider => chocolatey,
    }
}
