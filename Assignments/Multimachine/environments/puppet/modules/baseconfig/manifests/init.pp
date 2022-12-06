# Class: baseconfig

# Performs initial configuration for all Vagrant boxes

class baseconfig {
    exec { 'apt-get update': 
        command => '/usr/bin/apt-get update';
    }

    host {
        'hostmachine':
            ip => '192.168.0.1';
        
        'appserver':
            ip => '192.168.0.42';
        
        'dbserver':
            ip => '192.168.0.43';

        'web':
            ip => '192.168.0.44';
    }
}