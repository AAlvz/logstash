class base{
  package {'git':
    ensure => installed,
  }

  package {'emacs':
    ensure => present,
  }
}
