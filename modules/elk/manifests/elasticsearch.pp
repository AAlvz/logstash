class elk::elasticsearch {
  include elk::dependencies

  $es_link = "https://download.elasticsearch.org/elasticsearch/elasticsearch/elasticsearch-1.4.2.tar.gz"

  Exec {
    cwd  => '/home/vagrant',
    path => ["/bin", "/usr/bin", "/usr/sbin"],
  }

  exec {'download_ES':
    user    => 'vagrant',
    command => "wget \"$es_link\"",
    unless  => 'test -f /home/vagrant/elasticsearch-1.4.2.tar.gz',
  } ->

  exec {'extract_ES':
    user    => 'vagrant',
    command => 'tar -zxvf elasticsearch-1.4.2.tar.gz',
    unless  => 'test -d /home/vagrant/elasticsearch-1.4.2/',
  } ->

  exec {'initiate_ES':
    user    => 'vagrant',
    command => '/home/vagrant/elasticsearch-1.4.2/bin/elasticsearch &',
  }

}
