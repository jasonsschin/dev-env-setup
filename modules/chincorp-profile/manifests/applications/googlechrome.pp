class chincorp-profile::applications::googlechrome () inherits chincorp-profile::global_variables {

    package { "googlechrome":
        ensure => installed,
        provider => chocolatey,
    }
}
