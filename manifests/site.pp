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
    content => "puppet:///data/configs/nginx.conf"
  }

  file {'docker-compose': path => '/tmp/docker-compose.yml', 
  content => "puppet:///data/configs/docker-compose.yml"
}
  docker_compose { '/tmp/docker-compose.yml': ensure   => present }
}
