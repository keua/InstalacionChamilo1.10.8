# Instalacion de Chamilo 1.10.8
# Saesap Guatemala 2016
# Debian 8 (Squeeze)
# Referencia https://docs.puppet.com/

  # actualizacion de repositorios
  exec { 'actualizacion':
    command => 'apt-get update',
    path    => ['/usr/bin', '/usr/sbin',],
  }

  # instalacion de apache2
  package { 'libapache2-mod-php5':
    ensure => installed,
    require => Exec['actualizacion'],
  }

  # instalacion de mysqlserver
  package { 'mysql-server':
    ensure => installed,
    require => Exec['actualizacion'],
  }

  # instalacion de mysqlserver
  package { 'mysql-server':
    ensure => installed,
    require => Exec['actualizacion'],
  }

  # instalacion de php5-gd
  package { 'php5-gd':
    ensure => installed,
    require => Exec['actualizacion'],
  }

  # instalacion de php5-intl
  package { 'php5-intl':
    ensure => installed,
    require => Exec['actualizacion'],
  }

  # instalacion de php5-curl
  package { 'php5-curl':
    ensure => installed,
    require => Exec['actualizacion'],
  }

  # instalacion de php5-json
  package { 'php5-json':
    ensure => installed,
    require => Exec['actualizacion'],
  }