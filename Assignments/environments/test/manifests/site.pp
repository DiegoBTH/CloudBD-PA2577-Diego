# execute apt-get update
exec {'apt-update':
    command => '/usr/bin/apt-get update'
}

# Install nodejs on appServer node 
node 'appserver' {
    # execute apt-get install -y curl
    exec {'install-curl':
        #require => Exec['apt-update'],
        command => '/usr/bin/apt-get install -y curl'
    }

    # execute curl -sL https://deb.nodesource.com/setup_12.x | sudo -E bash -
    exec {'curl-update':
        #require => Exec['apt-update'],
        command => '/usr/bin/curl -sL https://deb.nodesource.com/setup_12.x | sudo -E bash -'
    }

    # execute apt-get install -y nodejs
    exec {'install-nodejs':
        #require => Exec['apt-update'],
        command => '/usr/bin/apt-get install -y nodejs'
    }
}

# Install and run mysql on db node
node 'dbserver' {
    package { 'mysql-server':
        ensure => installed,
    }

    service { 'mysql':
        ensure => true,
        enable => true,
        require => Package['mysql-server'],
    }
}

node 'web' {
    package { 'nginx':
        ensure => installed,
    }

    service { 'nginx':
        ensure => running,
        #enable => true,
        require => Package['nginx'],
    }
}

node 'tst0', 'tst1', 'tst2' {
    
}