#!/bin/sh

curl -sL --fail "https://ja4db.com/api/download/" | jq '. | sort' -S > ja4db.json && \
  jq '. | length' ja4db.json
