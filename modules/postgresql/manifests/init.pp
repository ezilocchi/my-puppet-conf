class postgresql {
  package { ['postgresql', 'libpq-dev', 'pgadmin3']:
    ensure => installed
  }
}
