#!/bin/sh
set -x

curl -sL -k --fail "https://ja4db.com/api/download/" | jq '. | sort' -S > ja4db.json && \
  jq '. | length' ja4db.json

jq '[.[] | select(.verified == true)]' ja4db.json > ja4db_verified.json && \
  jq '. | length' ja4db_verified.json
