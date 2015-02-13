include chincorp-profile::utilities::dotnet_35
include chincorp-profile::applications::sql2008r2
Class['chincorp-profile::utilities::dotnet_35'] -> Class['chincorp-profile::applications::sql2008r2']