##Install JAVA

Package {
  ensure => present,
}

Exec {
  path => ["/bin", "/usr/bin", "/usr/sbin"],
}

$es_repo = "deb http://packages.elasticsearch.org/elasticsearch/1.4/debian stable main"
$ls_repo = "deb http://packages.elasticsearch.org/logstash/1.4/debian stable main"

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

exec {'add_ls_repository':
  user    => root,
  command => "echo \"${ls_repo}\" | sudo tee -a /etc/apt/sources.list && sudo apt-get update -y",
} ->

package {'elasticsearch':} ->
package {'logstash':} ->

service {'elasticsearch':
  ensure => running,
  enable => true,
}
