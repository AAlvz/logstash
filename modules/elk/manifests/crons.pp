class elk::crons{
  file {'/etc/twitter.sh':
    ensure => present,
    owner => "${elk::params::user}",
    mode => '755',
    source => "puppet:///modules/elk/twitter.sh",
  }

  cron {'twitter':
    command => '/etc/twitter.sh',
    user => "${elk::params::user}",
    hour => '*',
    minute => '*/5',
    require => File['/etc/twitter.sh'],
  }

  file {'/etc/googleplus.sh':
    ensure => present,
    owner => "${elk::params::user}",
    mode => '755',
    source => "puppet:///modules/elk/googleplus.sh",
  }
  
  cron {'googleplus':
    command => '/etc/googleplus.sh',
    user => "${elk::params::user}",
    hour => '*',
    minute => '*/5',
    require => File['/etc/googleplus.sh'],
  }

}