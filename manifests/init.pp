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
  $license = $dokuwiki::params::license,
  $useacl = $dokuwiki::params::useacl,
  $admin_login = $dokuwiki::params::admin_login,
  $admin_password_hash = $dokuwiki::params::admin_password_hash,
  $admin_email = $dokuwiki::params::admin_email,
  $dir_owner = $dokuwiki::params::dir_owner,
  $dir_group = $dokuwiki::params::dir_group,
  $wiki_owner_name = $dokuwiki::params::wiki_owner_name,
  $install_name = $dokuwiki::params::install_name,
) inherits dokuwiki::params {
  class {'dokuwiki::install':
    
  }
  -> class {'dokuwiki::config':}
}
