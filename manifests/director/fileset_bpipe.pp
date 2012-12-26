# Define a FileSet resource that uses the bpipe plugin.
define bacula::director::fileset_bpipe($path, $reader, $writer,
  $compression = false, $comment = '')
{
  bacula::director::fileset { $name:
    content => template('bacula/bacula-dir.conf/fileset-bpipe.erb'),
    comment => $comment
  }
}
