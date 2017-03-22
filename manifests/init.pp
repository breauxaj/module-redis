# Class: redis
#
# This class installs Redis
#
# Parameters:
#
# Actions:
#   - Installs the redis package
#
# Requires:
#
# Sample Usage:
#
#  For a standard installation, use:
#
#    class { 'redis': }
#
class redis (
  $ensure = $::redis::params::redis_package_ensure
) inherits ::redis::params {
  package { $::redis::params::redis_package:
    ensure  => $ensure,
  }

  $config = hiera_hash('redis',{})
  create_resources('redis::config',$config)

  service { $::redis::params::redis_service:
    ensure  => running,
    enable  => true,
    require => Package[$::redis::params::redis_package],
  }
}
