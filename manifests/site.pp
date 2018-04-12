node default {
  class { 'docker': version => 'latest' }
  package { 'epel-release': ensure => 'installed' }
  package { 'python34-pip': ensure => 'installed' }

  package { ['docker-compose']:
    ensure   => present,
    provider => pip3,
  }

  file {'nginx.conf': 
    path => "/tmp/nginx.conf",
    source => "puppet:///modules/config/nginx.conf"
  }

  file {'docker-compose': path => '/tmp/docker-compose.yml', 
  source => "puppet:///modules/config/docker-compose.yml"
}
  docker_compose { '/tmp/docker-compose.yml': ensure   => present }
}
