# A description of what this class does
#
# @summary A short summary of the purpose of this class
#
# @example
#   include dokuwiki::config
class dokuwiki::config {
  file {"${dokuwiki::install_directory}/${dokuwiki::install_name}/conf/local.php":
    ensure  => file,
    content => epp('dokuwiki/local.php.epp'),
    mode    => '0764',
    owner   => $dokuwiki::dir_owner,
    group   => $dokuwiki::dir_group,
  }

  file {"${dokuwiki::install_directory}/${dokuwiki::install_name}/conf/users.auth.php":
    ensure  => file,
    content => epp('dokuwiki/users.auth.php.epp'),
    mode    => '0764',
    owner   => $dokuwiki::dir_owner,
    group   => $dokuwikki::dir_group,
  }

  #file {"${dokuwiki::install_directory}/${dokuwiki::install_name}/conf/acl.auth.php":
  #  ensure  => file,
  #  content => epp('dokuwiki/acl.auth.php.epp'),
  #  mode    => '0764',
  #  owner   => $dokuwiki::dir_owner,
  #  group   => $dokuwiki::dir_group,
  #}

  concat {"${dokuwiki::install_directory}/${dokuwiki::install_name}/conf/acl.auth.php":
    ensure => present,
    owner  => $dokuwiki::dir_owner,
    group  => $dokuwiki::dir_group,
  }
  
  concat::fragment {'dokuwiki_acl_header':
    target  => "${dokuwiki::install_directory}/${dokuwiki::install_name}/conf/acl.auth.php",
    content => epp('dokuwiki/acl_header.epp'),
    order   => '01',
  }

}
