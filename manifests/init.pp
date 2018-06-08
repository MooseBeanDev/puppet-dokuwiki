# A description of what this class does
#
# @summary A short summary of the purpose of this class
#
# @example
#   include dokuwiki
class dokuwiki (
  String $wiki_name = $dokuwiki::params::wiki_name,
  String $download_url = $dokuwiki::params::download_url,
  String $install_directory = $dokuwiki::params::install_directory,
  String $license = $dokuwiki::params::license,
  Numeric $useacl = $dokuwiki::params::useacl,
  String $admin_login = $dokuwiki::params::admin_login,
  String $admin_password = $dokuwiki::params::admin_password,
  String $admin_email = $dokuwiki::params::admin_email,
  String $dir_owner = $dokuwiki::params::dir_owner,
  String $dir_group = $dokuwiki::params::dir_group,
) inherits dokuwiki::params {
  class {'dokuwiki::install':
    
  }
}
