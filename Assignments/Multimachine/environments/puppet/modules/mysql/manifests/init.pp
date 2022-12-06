# Class: mysql

# Sets up mysql server and runs it

class mysql {
    # Installs the package
    package { ['mysql-server']:
        ensure => present;
    }

    # Runs the mysql server
    service { 'mysql':
        ensure => running,
        require => Package['mysql-server']; 
    }

    # Sets root password to: root
    exec { 'set-mysql-password':
    unless  => 'mysqladmin -uroot -proot status',
    command => "mysqladmin -uroot password root",
    path    => ['/bin', '/usr/bin'],
    require => Service['mysql'];
  }
}