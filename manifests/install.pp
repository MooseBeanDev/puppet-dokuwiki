class dokuwiki::install {
  package { 'tar':
    ensure  => installed
  }

  file { '/var/www/html/dokuwiki-stable.tgz':
    ensure  => present,
    source  => 'https://download.dokuwiki.org/src/dokuwiki/dokuwiki-stable.tgz',
    owner   => 'root',
    group   => 'root',
    mode    => '770',
    require => Package['tar'],
  }

  exec { 'tar -xzvf /var/www/html/dokuwiki-stable.tgz':
    cwd     => '/var/www/html',
    user    => 'root',
    path    => '/usr/bin',
    require => File['/var/www/html/dokuwiki-stable.tgz'],
  }

}
