#
# Manage syslog_ng package installation
#
class syslog_ng::package () {

  case $::osfamily {
    'Debian': {
      package { 'syslog-ng': ensure => $syslog_ng::ensure }
    }
    default: { fail "Operating system ${::operatingsystem} not supported" }
  }
}
