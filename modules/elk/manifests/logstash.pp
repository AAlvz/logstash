class elk::logstash{
  include elk::elasticsearch

  $ls_repo  = "deb http://packages.elasticsearch.org/logstash/1.4/debian stable main"
  $user     = $elk::user
  $log_path = $elk::log_path
  $log_media = $elk::log_media

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

  file {'/etc/logstash/conf.d':
    ensure  => directory,
  } ->

  file {'/opt/logstash/patterns/host-adblockplus':
    ensure => file,
    source => "puppet:///modules/elk/host-adblockplus",
  } ->

  logstash_conf {'simple_nginx.conf':} ->
  logstash_conf {'media.logstash':} ->

  service {'logstash-web':
    ensure => stopped,
  } ->

  service {'logstash':
    ensure => running,
  }

  define logstash_conf($fname = $title){
    file {"/etc/logstash/conf.d/${fname}":
      ensure  => file,
      content => template("elk/${fname}.erb"),
    }
  }

}
