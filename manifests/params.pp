# Class: redis::params
#
# This class set parameters used in this module
#
# Actions:
#   - Defines numerous parameters used by other classes
#
class redis::params {
  $redis_package_ensure = 'latest'

  case $::operatingsystem {
    'CentOS', 'OracleLinux', 'RedHat': {
      $redis_config  = '/etc/redis.conf'
      $redis_package = 'redis'
      $redis_service = 'redis'

      group { 'redis':
        ensure => present,
        gid    => 245,
      }
    
      user { 'redis':
        ensure     => present,
        gid        => 245,
        home       => '/var/lib/redis',
        shell      => '/bin/false',
        managehome => true,
        uid        => 245,
      }
    }
    'Debian': {
      case $::operatingsystemmajrelease {
        '8': {
          $redis_config  = '/etc/redis/redis.conf'
          $redis_package = 'redis-server'
          $redis_service = 'redis-server'

          group { 'redis':
            ensure => present,
            gid    => 245,
          }
        
          user { 'redis':
            ensure     => present,
            gid        => 245,
            home       => '/var/lib/redis',
            shell      => '/bin/false',
            managehome => true,
            uid        => 245,
          }
        }
        default: {
          fail("The ${module_name} module is not supported on an ${::operatingsystem} ${::operatingsystemmajrelease} distribution.")
        }
      }
    }
    default: {
      fail("The ${module_name} module is not supported on an ${::operatingsystem} based system.")
    }
  }
}