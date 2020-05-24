#!/bin/bash

# Description: Find endpoints in Angular project

 for f in $(grep -r '\.state(' . -l | sort | uniq); do grep 'url:' $f; done | sed 's/\s\s*//g' | cut -d':' -f2 | tr -d "\"\'," | sed 's@/$@@' | sort | uniq

 for f in $(grep -r '\.state(' . -l | sort | uniq); do grep -H 'url:' -B2 $f; done | awk 'BEGIN { RS=".state\\(" } { gsub(",","",$1); print $1":"$6 }' | tail -n +2 | grep -v modules
