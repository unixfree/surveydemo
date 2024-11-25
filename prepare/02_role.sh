curl --location -X PUT 'http://127.0.0.1:4985/survey/_role/stdrole' \
-H "Authorization: Basic ${DIGEST}" \
-H 'Content-Type: application/json' -H 'Accept: application/json' \
--data '{ "name": "survey_rw_role", "admin_channels": ["survey_adm_ch"] }'
