#!/bin/bash

if [[ $# -lt 1 ]]; then
    echo "Usage: $(basename $0) NMAP_FILE"
    exit
fi

nmap_file=$1

awk 'BEGIN { RS="Nmap scan report for " } { if ($1 != "#") { print $0 > "quicktcp_"$1".nmap" } }' $nmap_file
