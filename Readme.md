---
logstash tests.
---------------


Readme file will keep improving.

This is an introduction to ELK.

Now you can provision everything with puppet.

After provision:

To send logs to the vagrant instance you can use:

`nc 192.168.33.10 3333 < apache_logs_file`

and after that visualize everything in:

`192.168.33.10:5601`

If you want to test different logstash configurations this is the command to use
(Inside the Vagrant machine)

`/opt/logstash/bin/logstash -f /path/to/logstash.conf`

Make sure:

  - The log files are in the appropiate folder (I normally use /tmp)
