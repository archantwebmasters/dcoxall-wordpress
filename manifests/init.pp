# == Class: wordpress
#
# Installs and configures NGINX and PHP-FPM
# for serving Wordpress blogs.
#
# === Examples
#
#  class { "wordpress":
#    cache    => true,        # Enable/disable static asset caching... default false
#    database => 'wordpress', # Database name... default wordpress
#    user     => 'wordpress', # Database user name... default wordpress
#    password => 'wordpress', # Database user password... default wordpress
#  }
#
# === Authors
#
# Darren Coxall <darren@darrencoxall.com>
#
class webserver(
  $cache    = false,
  $database = 'wordpress',
  $user     = 'wordpress',
  $password = 'wordpress',
) {
  Exec {
    path => "/usr/bin",
  }

  class { "webserver::mysql":
    database => $database,
    user     => $user,
    password => $password,
  }

  class { "webserver::nginx":
    cache   => $cache,
  }

  class { "webserver::php":
  }
}
