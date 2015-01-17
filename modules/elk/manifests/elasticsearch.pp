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
  }

  # exec {'initiate_ES':
  #   user    => 'vagrant',
  #   command => '/home/vagrant/elasticsearch-1.4.2/bin/elasticsearch &',
  # }

  # exec {'get_elasticsearch_gpg_key':
  #   user    => 'vagrant',
  #   cwd     => '/home/vagrant/',
  #   command => 'wget https://packages.elasticsearch.org/GPG-KEY-elasticsearch',
  #   unless  => 'test -f /home/vagrant/GPG-KEY-elasticsearch',
  # } ->

  # exec {'add_elasticsearch_key':
  #   cwd     => '/home/vagrant/',
  #   user    => root,
  #   command => 'sudo apt-key add GPG-KEY-elasticsearch',
  #   unless  => 'sudo apt-key list | grep -c elasticsearch'
  # }

}
