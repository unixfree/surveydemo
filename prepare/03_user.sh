curl --location -g -X POST 'http://localhost:4985/survey/_user/' \
-H "Authorization: Basic ${DIGEST}" \
-H 'Content-Type: application/json' -H 'Accept: application/json' \
-d '{ "name": "investigator",
      "password": "Passw0rd!",
      "admin_roles": ["survey_rw_role"],
      "admin_channels": ["survey_ch"] 
    }'
