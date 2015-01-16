---
logstash tests.
---------------


Readme file will improve in the future.

This is an introduction to ELK.

Now you can provision everything with puppet.

After that, you need to turn on kibana (to visualize the data):

Run this:

> $ `vagrant ssh`
> $ `./kibana-4.0.0-beta3/bin/kibana`

To load data to elasticsearch using logstash (currently any apache logs can be used):

$ `cp /vagrant/{my_logs} /tmp/apache_logs`
$ `/opt/logstash/bin/logstash -f /vagrant/logstash_configs/logstash.conf`

To process logs run:

`logstash-1.4.2/bin/logstash -f logstash.conf`

Make sure:

  - The log files are in the appropiate folder (I normally use /tmp)
  - The Nginx file is set properly on sites-available
  - Run ElasticS -> Logstash -> Kibana
