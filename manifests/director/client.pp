# Define a Client (File service) to backup or restore.
define bacula::director::client(
  $password,
  $address = $name,
  $fd_port = 9102,
  $catalog = 'MyCatalog',
  $file_retention = '30 days',
  $job_retention = '6 months',
  $autoprune = 'yes')
{
  bacula::director::config_fragment { "client/${name}":
    content => template('bacula/bacula-dir.conf/client.erb')
  }
}
