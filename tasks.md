---

Tasks
-----

In order of priority

- [X] Puppetize everything.
- [X] Manipulate Elasticsearch manually.
- [X] ElasticsearchAPI with cURL
- [X] Split `lang` variable to display the main language.
- [X] Better filter for browser. Analyzed user agent.
- [X] Improve filter of request
- [X] Parse everything with NGINX grok patterns
- [X] Check parsing URI plugin. Not manually.
- [X] Add geoip
- [X] Test with full logs
- [X] Parse resource (request url)
- [X] Scripted fields to make better aggregations
- [X] Fix aggregation with ip_agent
- [X] Initial setup virtual machine for testing
- [ ] Puppet configuration for initial setup. 
- [ ] Puppet to stop 'logstash-web' service
- [ ] Fix failed parsing with israellist logs
- [ ] Make aggregations for downloads (code & kibana)
- [ ] Make aggregations with addoname (The ones Kirill asked) (code & kibana)
- [ ] Improve puppet module to parse abp nginx logs in port 3333 at boot.
- [X] Where are the aggregations?
- [X] Know how to make aggregations manually. (code)
- [X] Parese everything in JSON and send it to Kirill.
- [X] Recieve JSON, parse it, and display it.
- [X] Store all the failures while parsing.
- [X] Index failures and filter them
- [X] Better filtering for Adblock value at the end of some logs.
- [ ] Clean up code.

REMEMBER

- No filtering before indexing
- Early optimization is the root of all evil
- Facets are deprecated
Use the /{index}/{type}/{id}/_source endpoint to get just the _source field of the document.
Without any additional content around it.
For example:
curl -XGET 'localhost:9200/.kibana/visualization/_search?' | python -m json.too
curl -XGET 'http://localhost:9200/.kibana/visualization/Users-per-country/_source?_source_include=*.id&_source_exclude=entities'


IMPORTANT AGGREGATIONS
- How many downlads
- ABP reviews
- How many people have adblock + adblock plus

STRANGE DETAILS
- Possible DDOS Attacks from time to time.
- Some ips make a lot of requests.
- Requestes are being made to chrome_supplement.txt
  (apparently it was removed some time ago)

WHAT ELSE CAN BE DONE
- Implement notifications if something occurs.

IDEAS:
- Active users -> The ones whose Chrome browser has checked for an update
