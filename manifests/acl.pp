# A description of what this defined type does
#
# @summary A short summary of the purpose of this defined type.
#
# @example
#   dokuwiki::acl { 'namevar': }

define dokuwiki::acl (
  String $namespace,
  String $group,
  Numeric $permission,
) {
  concat::fragment { "dokuwiki_acl_${name}":
    target => "${dokuwiki::install_directory}/${dokuwiki::install_name}/conf/acl.auth.php",
    content => epp('dokuwiki/acl.epp', { 'namespace' => "$namespace", 'group' => "$group", 'permission' => $permission }),
    order => '10',
  }
}

