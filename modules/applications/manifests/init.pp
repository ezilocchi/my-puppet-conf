class applications {
  package { ['aptitude', 'pidgin', 'chromium-browser', 'tmux']:
    ensure => installed
  }
}
