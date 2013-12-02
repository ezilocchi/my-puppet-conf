class git {
  package { 'git':
    ensure => installed
  }

  exec { '/usr/bin/git config --global push.default simple':
    environment => "HOME=${home}",
    require     => [Package['git']]
  }
  exec { '/usr/bin/git config --global core.editor vim':
    environment => "HOME=${home}",
    require     => [Package['git']]
  }
  exec { '/usr/bin/git config --global color.ui true':
    environment => "HOME=${home}",
    require     => [Package['git']]
  }
}
