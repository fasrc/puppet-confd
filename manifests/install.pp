# == Class confd::install
#
class confd::install (
    $download_url = $confd::params::download_url,
  ) inherits confd::params {

  include confd

  staging::file { "${confd::installdir}/confd":
    source => $download_url,
    target => "${confd::installdir}/confd",
  }

  file { "${confd::installdir}/confd":
    ensure  => present,
    owner   => 'root',
    group   => 'root',
    mode    => '0750',
    require => Staging::File["${confd::installdir}/confd"],
  }
}
