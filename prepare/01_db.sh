DIGEST=`echo -n syncgateway:password | base64`
curl --location -X PUT 'http://127.0.0.1:4985/survey/' \
-H "Authorization: Basic ${DIGEST}" \
-H 'Content-Type: application/json' -H 'Accept: application/json' \
-d '{ "bucket": "travel-sample",
      "scopes": {
        "mobile": {
          "collections": {
            "survey": {
              "sync": "function(doc){channel(\"survey_ch\");}"
             } 
          }
        }
      },
     "num_index_replicas": 0
  }'
