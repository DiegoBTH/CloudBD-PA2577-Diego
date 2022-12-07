# Class: baseconfig

# Performs initial configuration for all Vagrant boxes

class baseconfig {
    # Executes the basic apt-get update command
    exec { 'apt-get update': 
        command => '/usr/bin/apt-get update';
    }

    # Create hostname and ip host entry for each server in my system
    host {
        'appserver':
            name => 'appserver',
            ip => '192.168.0.1',
            target => '/vagrant/hosts';
        
        'dbserver':
            name => 'dbserver',
            ip => '192.168.0.2',
            target => '/vagrant/hosts';

        'web':
            name => 'web',
            ip => '192.168.0.3',
            target => '/vagrant/hosts';

        'tst0':
            name => 'tst0',
            ip => '192.168.0.4',
            target => '/vagrant/hosts';
        
        'tst1':
            name => 'tst1',
            ip => '192.168.0.4',
            target => '/vagrant/hosts';
        
        'tst2':
            name => 'tst2',
            ip => '192.168.0.4',
            target => '/vagrant/hosts';
    }

    # Links the file /etc/hosts to /vagrant/hosts
    file { '/etc/hosts':
        ensure => link,
        target => '/vagrant/hosts',
    }
}