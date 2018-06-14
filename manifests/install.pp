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
    mode   => '775',
  }

#  file { '/var/install/dokuwiki-stable.tgz':
#    ensure  => present,
#    source  => $dokuwiki::download_url,
#    owner   => 'root',
#    group   => 'root',
#    mode    => '770',
#    require => File['/var/install/'],
#  }

#  exec { 'untar-dokuwiki':
#    command     => 'tar -xzvf /var/install/dokuwiki-stable.tgz',
#    cwd         => '/var/install',
#    user        => 'root',
#    path        => '/usr/bin',
#    refreshonly => true,
#    subscribe   => File['/var/install/dokuwiki-stable.tgz'],
#  }

  file { "${dokuwiki::install_directory}/${dokuwiki::install_name}":
    ensure  => directory,
#    source  => 'file:///var/install/dokuwiki-2018-04-22a',
    recurse => true,
    owner   => $dokuwiki::dir_owner,
    group   => $dokuwiki::dir_group,
#    require => Exec['untar-dokuwiki'],
    require => Exec['dokuwiki_move'],
  }

  archive { 'dokuwiki_tar':
    path => "/var/install/dokuwiki-stable.tgz",
    source => $dokuwiki::download_url,
    extract => true,
    extract_path => $dokuwiki::install_directory,
    creates => "${dokuwiki::install_directory}/${dokuwiki::install_name}",
    cleanup => false,
    user => root,
    group => root,
    require => File['/var/install/'],
  }

  exec { 'dokuwiki_move':
    command     => 'mv /var/www/html/dokuwiki-* /var/www/html/dokuwiki',
    user        => 'root',
    path        => '/usr/bin',
    refreshonly => true,
    subscribe   => Archive['dokuwiki_tar'],
  }
}
