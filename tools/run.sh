#!/bin/sh
set -x

curl -sL -k --fail "https://ja4db.com/api/download/" | jq '. | sort' -S > db.json && \
  jq '. | length' db.json

# Array with each element on a new line
jq -c 'walk(if type == "object" then with_entries(select(.value != null and .value != "")) else . end)' db.json | sed 's/{/\n{/g' | sed 's/}]/}\n]/g' > ja4db.json && \
jq '. | length' ja4db.json

# Filtered verified hashes
jq -c '[.[] | select(.verified == true) | walk(if type == "object" then with_entries(select(.value != null and .value != "")) else . end)]' db.json | sed 's/{/\n{/g' | sed 's/}]/}\n]/g' > ja4db_verified.json && \
jq '. | length' ja4db_verified.json
