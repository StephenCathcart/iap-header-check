#!/bin/sh -l

headers=$(curl --silent --head "$1" | awk '{print tolower($0)}') 
iap_header=$(echo "x-goog-iap-generated-response" | awk '{print tolower($0)}')

case "$headers" in
  *"$iap_header"*) exit 0;;
  *) exit 1;
esac