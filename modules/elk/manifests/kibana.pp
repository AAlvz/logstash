class elk::kibana{
  $rc_kibana = "https://download.elasticsearch.org/kibana/kibana/kibana-4.0.0-rc1-linux-x64.tar.gz"
  $user = $elk::user

  Exec {
    cwd  => "/home/${user}",
    path => ["/bin", "/usr/bin", "/usr/sbin"],
  }

  exec {'download_kibana':
    command => "wget \'$rc_kibana\'",
    unless  => "test -f /home/${user}/kibana-4.0.0-rc1-linux-x64.tar.gz",
  } ->

  exec {'extract_kibana':
    command => 'tar -zxvf kibana-4.0.0-rc1-linux-x64.tar.gz',
    unless  => "test -d /home/${user}/kibana-4.0.0-rc1-linux-x64/",
  } ->

  exec {'initiate_kibana':
    command => "/home/${user}/kibana-4.0.0-rc1-linux-x64/bin/kibana &",
    user    => "${user}",
  } ->

  cron {'initiate_kibana':
    command => "/home/${user}/kibana-4.0.0-rc1-linux-x64/bin/kibana",
    user    => "${user}",
    special => reboot,
  }

}
