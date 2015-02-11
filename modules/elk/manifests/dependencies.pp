class elk::dependencies{

  Package {
    ensure => installed,
  }

  exec {'update':
    user     => root,
    command  => 'sudo apt-get update -y --fix-missing',
    provider => "shell",
    path     => ["/bin", "/usr/bin", "/usr/sbin"],
  } ->

  package {'openjdk-7-jdk':} ->

  package {'git':} ->

  package {'emacs':}

}
