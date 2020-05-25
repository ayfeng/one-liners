#!/bin/bash
[ $# -ge 1 -a -f "$1" ] && input="$1" || input="-"

sort -t . -k 3,3n -k 4,4n
