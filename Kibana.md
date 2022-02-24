# Kibana

Example data for Kibana: [test-data.bulk.ndjson](test-data.bulk.ndjson)

Curl:
> curl -H "Content-Type:application/x-ndjson" -XPOST http://localhost:9200/_bulk --data-binary "@test-data.bulk.ndjson"