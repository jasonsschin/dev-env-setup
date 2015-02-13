class chincorp-role::dev {
    include chincorp-profile::applications::adobereader
    include chincorp-profile::utilities::boxstarter
    include chincorp-profile::utilities::dotnet_35
    contain chincorp-profile::utilities::git
    include chincorp-profile::utilities::7zip
    include chincorp-profile::utilities::poshgit
    include chincorp-profile::utilities::webpi
    include chincorp-profile::utilities::windowsazurepowershell
    include chincorp-profile::utilities::ruby_devkit
    include chincorp-profile::utilities::ruby
    include chincorp-profile::applications::fiddler4
    include chincorp-profile::applications::dotpeek
    include chincorp-profile::applications::googlechrome
    include chincorp-profile::applications::sourcetree
    include chincorp-profile::applications::p4merge
    include chincorp-profile::applications::resharper
    include chincorp-profile::applications::cmder
    include chincorp-profile::applications::sublimetext2
    include chincorp-profile::applications::linqpad4
    include chincorp-profile::applications::visualstudio2013ultimate
    include chincorp-profile::applications::sql2008r2
    #contain chincorp-profile::utilities::git_credential_winstore

    #include chincorp-profile::applications::markdownpad2
    #problems with default markdownpad2 choco pkg as it prompts you to select a language

    Class['chincorp-profile::utilities::dotnet_35'] -> Class['chincorp-profile::applications::sql2008r2']
    include chincorp-dev
}