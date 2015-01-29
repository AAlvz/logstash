These aggregations can be made with JSON or with Kibana.

There are different ways to run the aggregations:

    ` curl -XGET 'localhost:9200/logstash-2014.11.17/_search?pretty' -d @aggs1 `
    ` curl -XPOST 'localhost:9200/logstash-2014.11.17/_search?pretty' -d '{ "size":0, "aggs": { "aggregation_name" : { "terms": {"field": "lang_real", "size":5} } } }' `


Queries

    ` curl -XPOST 'localhost:9200/logstash-2014.11.17/_search?pretty' -d '{ "query": {"match_all": {}} }' `
