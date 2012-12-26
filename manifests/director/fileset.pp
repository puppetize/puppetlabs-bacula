# Define a FileSet resource.
define bacula::director::fileset($content, $comment = '')
{
  bacula::director::config_fragment { "fileset/${name}":
    content => template('bacula/bacula-dir.conf/fileset.erb')
  }
}
