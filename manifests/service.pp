#
# Manage syslog_ng daemon
#
class syslog_ng::service () {

  require 'syslog_ng::config'

  $ensure = $syslog_ng::ensure ? {
    'present' => 'running',
    default   => 'stopped'
  }

  service { 'syslog-ng':
    ensure    => $ensure,
    hasstatus => false,
  }

}
