class vim {
  package { 'vim':
    ensure => installed
  }

  #Ruby dependencies are defined as part of the puppet instalation process (see install.sh)
  exec { 'vim-janus':
    cwd     => "${home}",
    command => '/usr/bin/curl -Lo- https://bit.ly/janus-bootstrap | bash',
    creates => "${home}/.vim/janus",
    require => [Package['curl', 'vim', 'ack-grep', 'exuberant-ctags'], Class['git']]
  }
}
