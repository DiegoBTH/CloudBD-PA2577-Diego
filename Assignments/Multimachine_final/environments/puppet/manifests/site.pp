# create a new run stage to ensure certain modules are included first
stage { 'pre':
  before => Stage['main']
}

# add the baseconfig module to the new 'pre' run stage
class { 'baseconfig':
  stage => 'pre'
}

# all boxes get the base config
include baseconfig

node 'appserver' {
    # execute apt-get install -y curl
    exec { 'install-curl':
        command => '/usr/bin/apt-get install -y curl'
    }

    # execute curl -sL https://deb.nodesource.com/setup_12.x | sudo -E bash -
    exec {'curl-update':
        command => '/usr/bin/curl -sL https://deb.nodesource.com/setup_12.x | sudo -E bash -'
    }

    # execute apt-get install -y nodejs
    exec {'install-nodejs':
        command => '/usr/bin/apt-get install -y nodejs'
    }
}

node 'dbserver' {
    include mysql
}

node 'web' {
    include nginx
}

node 'tst0', 'tst1', 'tst2' {}