class chincorp-profile::utilities::ruby_devkit () inherits chincorp-profile::global_variables {

    package { "ruby.devkit":
        ensure => installed,
        provider => chocolatey,
    }
}
