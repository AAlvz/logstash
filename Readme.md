---
logstash tests.
---------------


Readme file will keep improving.

This is an introduction to ELK.

Now you can provision everything with puppet.

Configurations needed:

/modules/elk/manifests/params.pp

Be sure your logs are on the correct folder.

Currently it will work for nginx access logs.

If you need different kind of logs, make sure to create a logstas.conf file.

You can visualize everything in:

`192.168.33.10:5601`

If you want to test different logstash configurations this is the command to use
(Inside the Vagrant machine)

`/opt/logstash/bin/logstash -f /path/to/logstash.conf`

Make sure:

  - The log files are in the appropiate folder (I normally use /tmp)
