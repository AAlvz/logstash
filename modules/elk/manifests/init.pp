class elk {
  include base
  include elk::elasticsearch
  include elk::logstash
  include elk::kibana
}
