class elk::kibana {
  $beta_kibana = "https://download.elasticsearch.org/kibana/kibana/kibana-4.0.0-beta3.tar.gz"

  Exec {
    cwd  => "/home/vagrant",
    path => ["/bin", "/usr/bin", "/usr/sbin"],
  }

  exec {'download_kibana':
    command => "wget \"$beta_kibana\"",
  } ->

  exec {'extract_kibana':
    command => "tar -zxvf kibana-4.0.0-beta3.tar.gz",
  }

}
