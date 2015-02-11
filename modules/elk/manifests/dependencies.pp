class elk::dependencies{
  exec {'update':
    user     => root,
    command  => 'sudo apt-get update -y --fix-missing',
    provider => "shell",
    path     => ["/bin", "/usr/bin", "/usr/sbin"],
  } ->

  package {'openjdk-7-jdk':
    ensure => present,
  }

}
