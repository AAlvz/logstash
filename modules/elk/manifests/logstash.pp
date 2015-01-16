class elk::logstash {
  include elk::elasticsearch

  $ls_repo = "deb http://packages.elasticsearch.org/logstash/1.4/debian stable main"

  exec {'add_ls_repository':
    user    => root,
    command => "echo \"${ls_repo}\" | sudo tee -a /etc/apt/sources.list && sudo apt-get update -y",
    path    => ["/bin", "/usr/bin", "/usr/sbin"],
    require => Class['elk::elasticsearch'],
    unless  => 'grep -c "\logstash/1.4.debian"\  /etc/apt/sources.list',
  } ->

  package {'logstash':
    ensure => installed,
  }
}
