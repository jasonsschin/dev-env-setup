class chincorp-profile::applications::sql2008r2 () inherits chincorp-profile::global_variables {

    package { "sql2008r2":
        ensure => installed,
        provider => chocolatey,
        source => 'C:/vagrant_data/sql2008r2/'
    }

    package { "sql2008r2.3":
        ensure => installed,
        provider => chocolatey,
        source => 'C:/vagrant_data/sql2008r2.3/',
        require => Package['sql2008r2']
    }
}
