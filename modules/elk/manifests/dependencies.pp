class elk::dependencies(
  $user     = $elk::params::user,
  $shell    = $elk::params::shell,
  $password = $elk::params::password,
  $comment  = $elk::params::comment
) inherits elk::params{
  include users
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

  package {'emacs':} ->

  package {'openssh-server':}

  users::add {"${user}":
    shell => $shell,
    password_hash => $password,
    comment => $comment,
  } ->

  file { '/var/log/abp':
    ensure => 'directory',
    owner  => "${user}",
    group  => "${user}",
    mode   => "0644",
  }

}
