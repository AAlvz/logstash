class elk::kibana {
  $beta_kibana = "https://download.elasticsearch.org/kibana/kibana/kibana-4.0.0-beta3.tar.gz"

  Exec {
    cwd  => '/home/vagrant',
    path => ["/bin", "/usr/bin", "/usr/sbin"],
    user    => 'vagrant',
  }

  exec {'download_kibana':
    command => "wget \"$beta_kibana\"",
    unless  => 'test -f /home/vagrant/kibana-4.0.0-beta3.tar.gz',
  } ->

  exec {'extract_kibana':
    command => 'tar -zxvf kibana-4.0.0-beta3.tar.gz',
    unless  => 'test -d /home/vagrant/kibana-4.0.0-beta3/',
  } ->

  exec {'initiate_kibana':
    command => '/home/vagrant/kibana-4.0.0-beta3/bin/kibana &',
    require => Class['elk::elasticsearch'],
  }

}
