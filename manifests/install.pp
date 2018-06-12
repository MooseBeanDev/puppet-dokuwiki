# A description of what this class does
#
# @summary A short summary of the purpose of this class
#
# @example
#   include dokuwiki::install
class dokuwiki::install {
  file { '/var/install/':
    ensure => directory,
    owner  => 'root',
    group  => 'root',
    mode   => '770',
  }

  file { '/var/install/dokuwiki-stable.tgz':
    ensure  => present,
    source  => $dokuwiki::download_url,
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

  file { "${dokuwiki::install_directory}/${dokuwiki::install_name}":
    ensure  => directory,
    source  => 'file:///var/install/dokuwiki-2018-04-22a',
    recurse => true,
    owner   => $dokuwiki::dir_owner,
    group   => $dokuwiki::dir_group,
    require => Exec['untar-dokuwiki'],
  }
}
