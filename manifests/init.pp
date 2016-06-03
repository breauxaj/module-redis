# Class: redis
#
# This class installs the redis package
#
# Parameters:
#
#  ensure: (default latest)
#    Determine the state of the packages
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
#    class { 'redis':
#      ensure => 'latest'
#    }
#
#  To remove the installation, use:
#
#    class { 'redis':
#      ensure => 'absent'
#    }
#
class redis (
  $ensure = $::redis::params::redis_package_ensure
) inherits ::redis::params {
  package { $::redis::params::redis_package:
    ensure  => $ensure,
  }

  service { $::redis::params::redis_service:
    ensure  => running,
    enable  => true,
    require => Package[$::redis::params::redis_package],
  }
}