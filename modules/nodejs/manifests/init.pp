class nodejs {
  #TODO find a way to check if the repo was already added or nodejs is already intalled
  exec { 'add-nodejs-repo':
    command => '/usr/bin/add-apt-repository ppa:chris-lea/node.js && /usr/bin/apt-get update'
  }

  package { 'nodejs':
    ensure  => installed,
    require => Exec['add-nodejs-repo']
  }
}

