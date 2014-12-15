class chincorp-profile::utilities::git_credential_winstore () inherits chincorp-profile::global_variables {

    package { "git-credential-winstore":
        ensure => installed,
        provider => chocolatey,
    }
}
