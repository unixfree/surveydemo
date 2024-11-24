curl --location -g -X POST 'http://localhost:4985/travel-sample/_user/' \
-H "Authorization: Basic ${DIGEST}" \
-H 'Content-Type: application/json' -H 'Accept: application/json' \
-d '{ "name": "syncgateway",
      "password": "password",
      "admin_roles": ["stdrole"],
      "admin_channels": ["public"] 
    }'
