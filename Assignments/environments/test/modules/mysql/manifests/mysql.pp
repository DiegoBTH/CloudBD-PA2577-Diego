# This is used to install and run mysql to a server
class mysql {
    package { 'mysql-server':
        ensure => installed,
    }

    service { 'mysql':
        ensure => true,
        enable => true,
        require => Package['mysql-server'],
    }
}