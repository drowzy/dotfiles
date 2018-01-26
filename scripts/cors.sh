#! /usr/bin/env bash

curl -H "Origin: http://www.example.com" \
     -H 'Access-Control-Request-Headers: Origin, Accept, Content-Type' \
     -H "Access-Control-Request-Method: GET" \
     -H "Access-Control-Request-Headers: X-Requested-With" \
     -X OPTIONS --verbose \
     "$1"
