# Class: redis::params
#
# This class set parameters used in this module
#
# Actions:
#   - Defines numerous parameters used by other classes
#
class redis::params {
  $redis_package_ensure = 'latest'

  case $::osfamily {
    'RedHat': {
      $redis_config  = '/etc/redis.conf'
      $redis_package = 'redis'
      $redis_service = 'redis'
    }
    'Debian': {
      $redis_config  = '/etc/redis/redis.conf'

      $redis_package = 'redis-server'
      $redis_service = 'redis-server'
    }
    default: {
      fail("The ${module_name} module is not supported on an ${::osfamily} based system.")
    }
  }

}
