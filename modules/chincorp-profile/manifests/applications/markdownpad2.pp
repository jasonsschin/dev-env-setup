class chincorp-profile::applications::markdownpad2 () inherits chincorp-profile::global_variables {

    package { "markdownpad2":
        ensure => installed,
        provider => chocolatey,
    }
}
