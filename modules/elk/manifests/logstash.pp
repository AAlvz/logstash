class elk::logstash{
  include elk::elasticsearch

  $ls_repo = "deb http://packages.elasticsearch.org/logstash/1.4/debian stable main"
  $user = $elk::user

  exec {'add_ls_repository':
    user    => root,
    command => "echo \"${ls_repo}\" | sudo tee -a /etc/apt/sources.list && sudo apt-get update -y",
    path    => ["/bin", "/usr/bin", "/usr/sbin"],
    require => Class['elk::elasticsearch'],
    unless  => 'grep -c "\logstash/1.4.debian"\  /etc/apt/sources.list',
  } ->

  package {'logstash':
    ensure => installed,
  } ->

  service {'logstash':
    ensure => stopped,
  } ->

  service {'logstash-web':
    ensure => stopped,
  }

  # exec {'initiate_logstash_tcp':
  #   user    => '${user}',
  #   command => '/opt/logstash/bin/logstash -f /${user}/logstash_configs/simple_apache_tcp.conf &',
  # }

}
