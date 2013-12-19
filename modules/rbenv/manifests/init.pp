class rbenv {
  exec { 'rbenv-install':
    cwd     => "${home}",
    command => '/usr/bin/curl https://raw.github.com/fesplugas/rbenv-installer/master/bin/rbenv-installer | bash',
    creates => "${home}/.rbenv",
    require => [Package['curl'], Class['git']]
  }

  $rbenv_template = template('rbenv/set_rbenv.sh')
  $rbenv_conf = "\'${rbenv_template}\'"

  exec { 'rbenv-conf':
    command => "/bin/echo ${rbenv_conf} >> ${home}/.bashrc",
    require => Exec['rbenv-install'],
    unless  => '/usr/bin/which rbenv'
  }
}
