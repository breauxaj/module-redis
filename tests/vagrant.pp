node default {
  include ::redis

  redis::config { 'bind': value => "localhost ${::ipaddress}"; }

}