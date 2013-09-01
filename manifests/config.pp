#
# Config files
#
class syslog_ng::config () inherits syslog_ng {

  require 'syslog_ng::package'

  file { '/etc/syslog-ng/syslog-ng.conf':
    ensure  => $syslog_ng::ensure,
    owner   => 'root',
    mode    => '0440',
    content => template('syslog_ng/syslog-ng.conf.erb')
  }

}
