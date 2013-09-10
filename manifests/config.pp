#
# Config files and register device to loggly
#
class syslog_ng::config(
  $subdomain = false,
  $input = false,
  $user = false,
  $pass = false
  ) inherits syslog_ng {

  if ! $subdomain { fail 'You need to provide $subdomain' }
  if ! $input     { fail 'You need to provide $input' }
  if ! $user      { fail 'You need to provide $user' }
  if ! $pass      { fail 'You need to provide $pass' }

  require 'syslog_ng::package'

  file { '/etc/syslog-ng/syslog-ng.conf':
    ensure  => $syslog_ng::ensure,
    owner   => 'root',
    mode    => '0440',
    content => template('syslog_ng/syslog-ng.conf.erb')
  }

  $curl = "/usr/bin/curl -X POST -u ${user}:${pass}"
  $url = "http://${subdomain}.loggly.com/api/inputs/${input}/adddevice"
  $placeholder = "/etc/syslog-ng/${::hostname}.enabled"
  exec { 'register_to_loggly':
    command => "${curl} ${url} && /usr/bin/touch ${placeholder}",
    creates => $placeholder,
  }

}
