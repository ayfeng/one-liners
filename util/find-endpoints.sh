#!/bin/bash

# Description: Find endpoints in Angular project

 for f in $(grep -r '\.state(' . -l | sort | uniq); do grep 'url:' $f; done | sed 's/\s\s*//g' | cut -d':' -f2 | tr -d "\"\'," | sed 's@/$@@' | sort | uniq
