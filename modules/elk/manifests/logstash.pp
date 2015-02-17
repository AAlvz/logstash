class elk::logstash{
  include elk::elasticsearch

  $ls_repo  = "deb http://packages.elasticsearch.org/logstash/1.4/debian stable main"
  $user     = $elk::user
  $log_path = $elk::log_path

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

  file {'/opt/logstash/patterns/host-adblockplus':
    ensure => file,
    source => "puppet:///modules/elk/host-adblockplus",
  }

  file {'/etc/logstash/conf.d/logstash.conf':
    ensure  => file,
    content => template('elk/simple_nginx.conf.erb'),
  } ->

  service {'logstash-web':
    ensure => stopped,
  } ->

  service {'logstash':
    ensure => running,
  }

}
