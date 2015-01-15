##Install JAVA

Package {
  ensure => present,
}

Exec {
  path => ["/bin", "/usr/bin", "/usr/sbin"],
}

$es_repo = "deb http://packages.elasticsearch.org/elasticsearch/1.4/debian stable main"

exec {'update':
  user    => root,
  command => 'sudo apt-get update -y --fix-missing',
  provider=> "shell",
} ->

package {'openjdk-7-jdk':} ->

exec {'get_elasticsearch_gpg_key':
  cwd     => '/home/vagrant/',
  command => 'wget https://packages.elasticsearch.org/GPG-KEY-elasticsearch',
} ->

exec {'add_elasticsearch_key':
  cwd     => '/home/vagrant/',
  user    => root,
  command => 'sudo apt-key add GPG-KEY-elasticsearch',
} ->

exec {'add_es_repository':
  user    => root,
  command => "echo \"${es_repo}\" | sudo tee -a /etc/apt/sources.list && sudo apt-get update -y",
} ->

package {'elasticsearch':} ->

# exec {'start_es_at_boot':
#   user    => root,
#   command => "sudo update-rc.d elasticsearch defaults 95 10",
# } ->

service {'elasticsearch':
  ensure => running,
  enable => true,
}
