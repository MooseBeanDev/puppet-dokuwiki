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

  exec { 'untar':
    command     => 'tar -xzvf /var/install/dokuwiki-stable.tgz',
    cwd         => '/var/www/html',
    user        => 'root',
    path        => '/usr/bin',
    refreshonly => true,
    subscribe   => File['/var/install/dokuwiki-stable.tgz'],
  }

  exec { 'mv /var/www/html/dokuwiki-* /var/www/html/dokuwiki':
    user        => 'root',
    path        => '/usr/bin',
    refreshonly => true,
    subscribe   => Exec['untar'],
  }

}
