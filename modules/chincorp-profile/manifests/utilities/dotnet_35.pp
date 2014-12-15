class chincorp-profile::utilities::dotnet_35 () inherits chincorp-profile::global_variables {

    package { "dotnet3.5":
        ensure => installed,
        provider => chocolatey,
    }
}
