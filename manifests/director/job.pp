# Define a backup or restore Job.
define bacula::director::job($comment, $client, $fileset, $accurate = false,
  $jobdefs = '', $type = '', $messages = '', $level = '', $content = '',
  $storage = '', $pool = '', $where = '', $template = '')
{
  bacula::director::config_fragment { "job/${name}":
    content => template('bacula/bacula-dir.conf/job.erb')
  }
}
