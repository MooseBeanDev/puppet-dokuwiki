# A description of what this class does
#
# @summary A short summary of the purpose of this class
#
# @example
#   include dokuwiki::install
class dokuwiki::install {
  file { "$dokuwiki::staging_directory":
    ensure => directory,
    owner  => 'root',
    group  => 'root',
    mode   => '775',
  }

  file { "${dokuwiki::install_directory}/${dokuwiki::install_name}":
    ensure  => directory,
    recurse => true,
    owner   => $dokuwiki::dir_owner,
    group   => $dokuwiki::dir_group,
    require => Exec['dokuwiki_move'],
  }

  archive { 'dokuwiki_tar':
    path => "${dokuwiki::staging_directory}/dokuwiki-stable.tgz",
    source => $dokuwiki::download_url,
    extract => true,
    extract_path => $dokuwiki::install_directory,
    creates => "${dokuwiki::install_directory}/${dokuwiki::install_name}",
    cleanup => false,
    user => root,
    group => root,
    require => File["$dokuwiki::staging_directory"],
  }

  exec { 'dokuwiki_move':
    command     => "mv /var/www/html/dokuwiki-* /var/www/html/${dokuwiki::install_name}",
    user        => 'root',
    path        => '/usr/bin',
    refreshonly => true,
    subscribe   => Archive['dokuwiki_tar'],
  }
}
