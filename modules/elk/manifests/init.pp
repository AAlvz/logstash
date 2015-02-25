class elk(
  $user = $elk::params::user
) inherits elk::params {
  include elk::elasticsearch
  include elk::logstash
  include elk::kibana
  include elk::crons
}
