class rbenv {
  exec { 'rbenv-install':
    cwd     => "${home}",
    command => '/usr/bin/curl https://raw.github.com/fesplugas/rbenv-installer/master/bin/rbenv-installer | bash',
    creates => "${home}/.rbenv",
    require => [Package['curl'], Class['git']]
  }

  file { '/etc/profile.d/set_rbenv.sh':
    source  => ['puppet:///modules/rbenv/set_rbenv.sh'],
    require => [Exec['rbenv-install']]
  }
}
