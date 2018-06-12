# A description of what this class does
#
# @summary A short summary of the purpose of this class
#
# @example
#   include dokuwiki::params
class dokuwiki::params {
  $wiki_name = 'Puppet Dokuwiki Install'
  $download_url = 'https://download.dokuwiki.org/src/dokuwiki/dokuwiki-stable.tgz'
  $install_directory = '/var/www/html'
  $license = 'cc-by-sa'
  $useacl = 1
  $admin_login = 'admin'
  $admin_password_hash = '$1$puppet$0ogBhoD.dY7B3lPZ2HfeX/'
  $admin_email = 'admin@localhost.internal'
  $dir_owner = 'apache'
  $dir_group = 'apache'
  $wiki_owner_name = 'Admin'
  $install_name = 'dokuwiki'
}
