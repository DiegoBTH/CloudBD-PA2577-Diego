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

node 'appserver.bth.se' {
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

node 'dbserver.bth.se' {
    include mysql
}

node 'web.bth.se' {
    include nginx
}

node 'tst0.bth.se', 'tst1.bth.se', 'tst2.bth.se' {}