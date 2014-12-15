class chincorp-profile::utilities::webpi () inherits chincorp-profile::global_variables {

    package { "webpi":
        ensure => installed,
        provider => chocolatey,
    }
}
