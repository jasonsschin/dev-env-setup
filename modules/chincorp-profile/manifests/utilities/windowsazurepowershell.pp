class chincorp-profile::utilities::windowsazurepowershell () inherits chincorp-profile::global_variables {

    package { "windowsazurepowershell":
        ensure => installed,
        provider => chocolatey,
    }
}
