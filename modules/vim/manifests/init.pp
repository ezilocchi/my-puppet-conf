class vim {
  package { 'vim':
    ensure => installed
  }

  exec { 'gem-rake':
    cwd     => "${home}",
    command => '/usr/bin/gem install rake'
  }

  #Ruby interpreter is installed as part of the puppet instalation process (see install.sh)
  exec { 'vim-janus':
    cwd     => "${home}",
    command => '/usr/bin/curl -Lo- https://bit.ly/janus-bootstrap | bash',
    creates => "${home}/.vim/janus",
    require => [
      Package['curl', 'vim', 'ack-grep', 'exuberant-ctags'],
      Class['git'],
      Exec['gem-rake']
    ]
  }
}
