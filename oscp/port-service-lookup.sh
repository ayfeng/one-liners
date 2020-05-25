#!/bin/bash

# Description: Provide quick info lookup for services expected to run on given ports, leveraging nmap's service resource file

services_filepath=/usr/share/nmap/nmap-services

if [[ $# -lt 1 ]]; then
    echo "Usage: $(basename $0) PORT1 PORT2 .. PORTN"
fi

if [ ! -f $services_filepath ]; then
    echo "Could not find nmap services file at $services_filepath. Is nmap installed?"
    exit 1
fi

for port in "$@"; do
    grep "[^0-9]${port}/tcp" /usr/share/nmap/nmap-services
done
