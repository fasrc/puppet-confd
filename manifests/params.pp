# == Class confd::params
#
# This class is meant to be called from confd
# It sets variables according to platform
#
class confd::params {
  $confdir      = '/etc/confd'
  $version      = '0.11.0'
  $user         = 'root'
  $sitemodule   = 'site_confd'
  $nodes        = ['127.0.0.1:4001']
  $download_url = "https://github.com/kelseyhightower/confd/releases/download/v${version}/confd-${version}-linux-amd64"

  case $::osfamily {
    'Debian': {
      $installdir   = '/usr/local/bin'
    }
    'RedHat', 'Amazon': {
      $installdir   = '/usr/bin'
    }
    default: {
      fail("${::operatingsystem} not supported")
    }
  }
}
