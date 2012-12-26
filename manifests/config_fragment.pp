# Manage a configuration file fragment.
#
# This definition can either use the concat or file_concat module.
define bacula::config_fragment($target, $content, $order = '10')
{
  include bacula::config

  if $bacula::config::use_file_concat {
    file_fragment { $name:
      target  => $target,
      content => $content,
      order   => $order
    }
  } else {
    concat::fragment { $name:
      target  => $target,
      content => $content,
      order   => $order
    }
  }
}
