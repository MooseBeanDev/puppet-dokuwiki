# A description of what this class does
#
# @summary A short summary of the purpose of this class
#
# @example
#   include dokuwiki
class dokuwiki (
  $wiki_name = $dokuwiki::params::wiki_name,
  $download_url = $dokuwiki::params::download_url,
  $install_directory = $dokuwiki::params::install_directory,
  $install_name = $dokuwiki::params::install_name,
  $lang = $dokuwiki::params::lang,
  $license = $dokuwiki::params::license,
  $useacl = $dokuwiki::params::useacl,
  $acl_state = $dokuwiki::params::acl_state,
  $disable_actions = $dokuwiki::params::disable_actions,
  $admin_login = $dokuwiki::params::admin_login,
  $admin_password_hash = $dokuwiki::params::admin_password_hash,
  $admin_email = $dokuwiki::params::admin_email,
  $admin_groups = $dokuwiki::params::admin_groups,
  $dir_owner = $dokuwiki::params::dir_owner,
  $dir_group = $dokuwiki::params::dir_group,
  $wiki_owner_name = $dokuwiki::params::wiki_owner_name,
  $staging_directory = $dokuwiki::params::staging_directory,
) inherits dokuwiki::params {
  class {'dokuwiki::install':
    
  }
  -> class {'dokuwiki::config':}
}
