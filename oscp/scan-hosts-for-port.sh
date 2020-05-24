#!/bin/bash

if [[ $# -lt 2 ]]; then
    cat << EOF
Usage: $(basename $0) PORTNUMBER SCANDIR

Common ports:
    21   - FTP
    22   - SSH
    23   - Telnet
    25   - SMTP
    69   - TFTP
    80   - HTTP
    88   - Kerberos
    110  - Pop3
    111  - Rpcbind
    139  - SMB
    143  - IMAP

    443  - HTTPS
    445  - Samba
    631  - CUPS
    993  - IMAP Encrypted
    3306 - MySQL
    3389 - RDP
    8080 - Various (e.g. Tomcat)
EOF
    exit 1
fi

scandir="$1"
port=$2

if [[ ! -d "$scandir" ]]; then
    echo "SCANDIR $scandir does not exist. Exiting..."
    exit
fi

for f in $(grep -r '^'$port'/\(tcp\|udp\)' -l "$scandir"); do head -1 "$f" | sed 's/.* \([0-9]*\.[0-9]*\.[0-9]*\.[0-9]*\)/\1/'; done | grep -v '/[0-9]*$' | sort -t . -k 3,3n -k 4,4n | uniq
