---
logstash tests.
---------------


Readme file will improve in the future.

This is an introduction to ELK.

Now you can provision everything with puppet.

After that, you need to turn on kibana (to visualize the data):

Run this:

$ `vagrant ssh`

$ `./kibana-4.0.0-beta3/bin/kibana`

To load data to elasticsearch using logstash (normal apache logs currently):

nc 192.168.33.10  3333 < apache_log

To make tests with different logstash config files:

`vagrant@elk$ logstash-1.4.2/bin/logstash -f test_logstash.conf`

After that you can view the data in:

`192.168.33.10:5601`

Make sure:

  - The log files path match the one used in logstash config file. (I normally use /tmp)
