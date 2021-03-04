# Elastic Search

## Pull & Run

```bash
$ docker pull docker.elastic.co/elasticsearch/elasticsearch:7.1.1
$ docker run -p 9200:9200 -p 9300:9300 -e "discovery.type=single-node" docker.elastic.co/elasticsearch/elasticsearch:7.1.1
```

## Create New Index

Index for a nested search:

```bash
curl -H'Content-Type: application/json' -XPUT "http://localhost:9200/images" -d '{
    "mappings": {
        "_doc" : {
            "properties" : {
                "gv_labels" : {
                    "type" : "nested"
                }
            }
        }
    }
}'
```

## Query a nested index

```bash
curl  -H'Content-Type: application/json' -XGET 'http://localhost:9200/images/_doc/_search' -d '{
  "size": 25,
  "from": 0,
  "sort": [
    { "_score": { "order": "desc" } },
    { "saved_at": { "order": "desc" } }
  ],
  "query": {
    "bool": {
      "must": [
        {
          "match": {
            "account_id": 1
          }
        },
        {
          "match": {
            "index_id": 1
          }
        },
        {
          "nested" : {
            "path" : "gv_labels",
            "score_mode" : "avg",
            "query" : {
              "bool" : {
                "must" : [
                   {
                     "query_string": {
                       "analyze_wildcard": true,
                       "query": "nature",
                       "fields": [
                         "gv_labels.text"
                       ]
                     }
                   },
                  { "range" : {"gv_labels.score" : {"gte" : 0.1}} }
                ]
              }
            }
          }
        }
      ]
    }
  }
}
'
```
