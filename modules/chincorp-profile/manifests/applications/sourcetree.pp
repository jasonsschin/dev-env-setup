class chincorp-profile::applications::sourcetree () inherits chincorp-profile::global_variables {

    package { "sourcetree":
        ensure => installed,
        provider => chocolatey,
    }
}
