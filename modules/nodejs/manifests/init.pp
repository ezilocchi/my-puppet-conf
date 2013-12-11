class nodejs {
  exec { 'add-nodejs-repo':
    command => '/usr/bin/add-apt-repository ppa:chris-lea/node.js && /usr/bin/apt-get update',
    unless  => '/bin/ls -ls /usr/bin | grep nodejs'
  }

  package { 'nodejs':
    ensure  => installed,
    require => Exec['add-nodejs-repo']
  }
}

