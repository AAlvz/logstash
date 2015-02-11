class elk::kibana(
  $user = $elk::params::user
) inherits elk::params {
  $beta_kibana = "https://download.elasticsearch.org/kibana/kibana/kibana-4.0.0-beta3.tar.gz"

  Exec {
    cwd  => "/home/${user}",
    path => ["/bin", "/usr/bin", "/usr/sbin"],
  }

  exec {'download_kibana':
    command => "wget \'$beta_kibana\'",
    unless  => "test -f /home/${user}/kibana-4.0.0-beta3.tar.gz",
  } ->

  exec {'extract_kibana':
    command => 'tar -zxvf kibana-4.0.0-beta3.tar.gz',
    unless  => "test -d /home/${user}/kibana-4.0.0-beta3/",
  } ->

  exec {'initiate_kibana':
    command => "/home/${user}/kibana-4.0.0-beta3/bin/kibana &",
  } ->

  cron {'initiate_kibana':
    command => "/home/${user}/kibana-4.0.0-beta3/bin/kibana",
    user    => "${user}",
    special => reboot,
  }

}
