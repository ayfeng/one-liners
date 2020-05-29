if [[ $# -ne 1 ]]; then
    echo "Usage: $(basename $0) SUBNET"
    echo "Example: $(basename $0) 10.11.1.0"
    exit 1
fi

subnet=$1
prefix=$(sed 's/.[0-9]*$//' <<< $subnet)

for x in $(seq 1 255); do ((res=$(echo 'VRFY root' | nc -C -q2 -w2 $prefix.$x 25 2>/dev/null | grep 252) && wait && if [[ ! -z "$res" ]]; then echo -e "\n$prefix.$x responded to VRFY with: $res"; fi) &); done
