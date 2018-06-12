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

  #file {"${dokuwiki::install_directory}/${dokuwiki::install_name}/conf/users.auth.php":
  #  ensure  => file,
  #  content => epp('dokuwiki/users.auth.php.epp'),
  #  mode    => '0764',
  #  owner   => $dokuwiki::dir_owner,
  #  group   => $dokuwikki::dir_group,
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
 
  concat {"${dokuwiki::install_directory}/${dokuwiki::install_name}/conf/users.auth.php":
    ensure => present,
    owner  => $dokuwiki::dir_owner,
    group  => $dokuwiki::dir_group,
  }
  
  concat::fragment {'dokuwiki_users_header':
    target  => "${dokuwiki::install_directory}/${dokuwiki::install_name}/conf/users.auth.php",
    content => epp('dokuwiki/users_header.epp'),
    order   => '01',
  }

  if $dokuwiki::useacl == 1 {
    dokuwiki::user {'administrator':
      user_login => "$dokuwiki::admin_login",
      user_password_hash => "$dokuwiki::admin_password_hash",
      user_full_name => "$dokuwiki::wiki_owner_name",
      user_email => "$dokuwiki::admin_email",
      user_groups => "$dokuwiki::admin_groups",
    }

    if $dokuwiki::acl_state == 'open' {
      dokuwiki::acl {'all':
        namespace  => '*',
        group      => '@ALL',
        permission => 8,
      }
    } elsif $dokuwiki::acl_state == 'public' {
      dokuwiki::acl {'all':
        namespace  => '*',
        group      => '@ALL',
        permission => 1,
      }
      dokuwiki::acl {'users':
        namespace  => '*',
        group      => '@user',
        permission => 8,
      }
    } elsif $dokuwiki::acl_state == 'closed' {
      dokuwiki::acl {'all':
        namespace  => '*',
        group      => '@ALL',
        permission => 0,
        }
      dokuwiki::acl {'users':
        namespace  => '*',
        group      => '@user',
        permission => 8,
      }
    }
  }
}
