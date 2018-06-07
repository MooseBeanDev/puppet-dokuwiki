class dokuwiki::install {
  file { '/var/install/':
    ensure => directory,
    owner  => 'root',
    group  => 'root',
    mode   => '770',
  }

  file { '/var/install/dokuwiki-stable.tgz':
    ensure  => present,
    source  => 'https://download.dokuwiki.org/src/dokuwiki/dokuwiki-stable.tgz',
    owner   => 'root',
    group   => 'root',
    mode    => '770',
    require => File['/var/install/'],
  }

  exec { 'untar-dokuwiki':
    command     => 'tar -xzvf /var/install/dokuwiki-stable.tgz',
    cwd         => '/var/install',
    user        => 'root',
    path        => '/usr/bin',
    refreshonly => true,
    subscribe   => File['/var/install/dokuwiki-stable.tgz'],
  }

  file { '/var/www/html/dokuwiki':
    ensure => directory,
    source => 'file:///var/install/dokuwiki-2018-04-22a',
    recurse => true,
    owner => 'apache',
    group => 'apache',
    require => Exec['untar-dokuwiki'],
  }

}
