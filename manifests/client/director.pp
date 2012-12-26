# Define a Director who is permitted to contact this File daemon.
define bacula::client::director($password, $monitor = false)
{
  include bacula::client

  bacula::config_fragment { "bacula::client::director/${name}":
    target  => $bacula::client::client_conf,
    content => template('bacula/bacula-fd.conf/director.erb'),
  }
}
