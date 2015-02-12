class users {
  define add ($username = $title, $shell, $comment, $password_hash) {
    user { $username:
      ensure     => present,
      shell      => $shell,
      password   => $password_hash,
      comment    => $comment,
      home       => "/home/${username}",
      managehome => true,
    }
  }
}
