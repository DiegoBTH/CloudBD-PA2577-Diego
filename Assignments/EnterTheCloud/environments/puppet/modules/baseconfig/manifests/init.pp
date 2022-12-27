# Class: baseconfig

# Performs initial configuration for all Vagrant boxes

class baseconfig {
    # Executes the basic apt-get update command
    exec { 'apt-get update': 
        command => '/usr/bin/apt-get update';
    }
}