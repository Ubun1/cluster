node default {
  class { 'docker':
    version => 'latest',
  }
  docker::image { 'postgres': }
}
