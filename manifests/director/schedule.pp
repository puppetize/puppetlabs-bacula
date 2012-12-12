# Define a job schedule.
#
# == Parameters
#
# - *run*: "The Run directive defines when a Job is to be run,
#   and what overrides if any to apply."  The value must be a
#   string or an array of strings.
#
# == Example
#
# The following example defines a schedule named 'NEVER' which
# will never execute any jobs.  Such a schedule is useful for
# permanently disabling jobs, cascading jobs, or jobs triggered
# via other means (e.g., cron).
#
#  bacula::director::schedule { 'NEVER':
#    run => []
#  }
#
# The next example defines the two standard schedules:
#
#  bacula::director::schedule { 'WeeklyCycle':
#    run => [
#      'Level=Full First Sun at 23:05',
#      'Level=Differential Second-Fifth Sun at 23:05',
#      'Level=Incremental Mon-Sat at 23:05'
#    ]
#  }
#
#  bacula::director::schedule { 'WeeklyCycleAfterBackup':
#    run => 'Level=Full Mon-Sun at 23:10'
#  }
define bacula::director::schedule($run)
{
  bacula::director::config_fragment { "schedule/${name}":
    content => template('bacula/bacula-dir.conf/schedule.erb')
  }
}
