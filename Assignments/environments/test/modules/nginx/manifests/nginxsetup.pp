# This is used to install and run mysql to a server
class nginxsetup {
    package { 'nginx':
        ensure => installed,
    }

    service { 'nginx':
        ensure => running,
        #enable => true,
        require => Package['nginx'],
    }
}