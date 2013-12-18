class jdk {
  exec { 'add-oracle-jdk-repo':
    command => '/usr/bin/add-apt-repository ppa:webupd8team/java && /usr/bin/apt-get update',
    unless  => '/bin/ls -ls /usr/bin | grep javac'
  }

  package { 'oracle-jdk7-installer':
    ensure  => installed,
    require => Exec['add-oracle-jdk-repo']
  }
}

