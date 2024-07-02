#!/bin/sh

curl -sL "https://ja4db.com/api/download/" | jq . -S > ja4db.json && \
  jq '. | length' ja4db.json
