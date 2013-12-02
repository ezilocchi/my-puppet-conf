class commons {
  package { ['curl', 'ack-grep', 'exuberant-ctags']:
    ensure => installed
  }
}
