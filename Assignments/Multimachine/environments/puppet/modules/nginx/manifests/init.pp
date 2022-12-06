# Class: nginx

# Sets up nginx package and runs it

class nginx {
    # Installs the package
    package { ['nginx']:
        ensure => present;
    }

    # Runs the nginx server
    service { 'nginx':
        ensure => running,
        require => Package['nginx']; 
    }
}