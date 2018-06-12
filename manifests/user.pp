# A description of what this defined type does
#
# @summary A short summary of the purpose of this defined type.
#
# @example
#   dokuwiki::user { 'namevar': }
define dokuwiki::user(
  String $user_login,
  String $user_password_hash,
  String $user_full_name,
  String $user_email,
  String $user_groups,
) {
  concat::fragment { "dokuwiki_user_${name}":
    target => "${dokuwiki::install_directory}/${dokuwiki::install_name}/conf/users.auth.php",
    content => epp('dokuwiki/user.epp', 
      { 'user_login' => "$user_login", 
        'user_password_hash'  => "$user_password_hash",
        'user_full_name' => "$user_full_name",
        'user_email' => "$user_email",
        'user_groups' => "$user_groups"
      }),
    order => '10',
  }
}
