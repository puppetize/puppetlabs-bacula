# Manage a fragmented configuration file.
#
# For each config_file there must be at least one fragment.
#
# This definition can either use the concat or file_concat module.
define bacula::config_file($owner = undef, $group = undef,
  $mode = undef, $content = undef)
{
  include bacula::config

  if $bacula::config::use_file_concat {
    file_concat { $name:
      ensure => present,
      mode   => $mode,
      owner  => $owner,
      group  => $group
    }
  } else {
    concat { $name:
      mode   => $mode,
      owner  => $owner,
      group  => $group
    }
  }

  if $content != undef {
    bacula::config_fragment { $name:
      target  => $name,
      content => $content
    }
  }
}
