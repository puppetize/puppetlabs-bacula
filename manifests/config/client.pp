define bacula::config::client (
   $director_name,
   $fileset  = 'Basic:noHome',
   $bacula_schedule = 'WeeklyCycle'
 ) {
 # XXX: schedule is a meta-parameter
 $schedule = $bacula_schedule

 if ! is_domain_name($name) {
   fail "Name for client ${name} must be a fully qualified domain name"
 }

 $name_array = split($name, '[.]')
 $hostname   = $name_array[0]

 file { "/etc/bacula/bacula-dir.d/${name}.conf":
   ensure  => file,
   mode    => '0440',
   owner   => 'bacula',
   group   => 'bacula',
   content => template('bacula/client_config.erb'),
   notify  => Service['bacula-director'],
 }
}
