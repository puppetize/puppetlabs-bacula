# Manage a file fragment of bacula-dir.conf.
define bacula::director::config_fragment($content, $order = '10')
{
  bacula::config_fragment { "bacula::director::config_fragment/${name}":
    target  => '/etc/bacula/bacula-dir.conf',
    content => $content,
    order   => $order
  }
}
