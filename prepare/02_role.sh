curl --location -X PUT 'http://127.0.0.1:4985/travel-sample/_role/stdrole' \
-H "Authorization: Basic ${DIGEST}" \
-H 'Content-Type: application/json' -H 'Accept: application/json' \
--data '{ "name": "stdrole", "admin_channels": ["newrolechannel"] }'
