# == Class: syslog_ng
#
# Full description of class syslog-ng here.
#
# === Parameters
#
# Document parameters here.
#
# [*sample_parameter*]
#   Explanation of what this parameter affects and what it defaults to.
#   e.g. "Specify one or more upstream ntp servers as an array."
#
# === Variables
#
# Here you should define a list of variables that this module would require.
#
# [*sample_variable*]
#   Explanation of how this variable affects the funtion of this class and if it
#   has a default. e.g. "The parameter enc_ntp_servers must be set by the
#   External Node Classifier as a comma separated list of hostnames." (Note,
#   global variables should not be used in preference to class parameters  as of
#   Puppet 2.6.)
#
# === Examples
#
#  class { syslog-ng:
#    servers => [ 'pool.ntp.org', 'ntp.local.company.com' ]
#  }
#
# === Authors
#
# Alexander Fortin <alexander.fortin@gmail.com>
#
# === Copyright
#
# Copyright 2013 Your name here, unless otherwise noted.
#
class syslog_ng (
  $ensure = 'present'
  ) {

  include 'syslog_ng::package'
  include 'syslog_ng::config'
  include 'syslog_ng::service'

  Class['syslog_ng::config'] ~> Class['syslog_ng::service']

}
