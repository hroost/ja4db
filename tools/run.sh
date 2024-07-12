#!/bin/sh
set -x

curl -sL -k --fail "https://ja4db.com/api/download/" | jq '. | sort' -S > db.json && \
  jq '. | length' db.json

# Array with each element on a new line
cat db.json | jq -c '.' | sed 's/{"application/\n{"application/g' | sed 's/}]/}\n]/g' > ja4db.json && \
jq '. | length' ja4db.json

# Filtered verified hashes
cat db.json | jq -c '[.[] | select(.verified == true)]' | sed 's/{"application/\n{"application/g' | sed 's/}]/}\n]/g' > ja4db_verified.json && \
jq '. | length' ja4db_verified.json
