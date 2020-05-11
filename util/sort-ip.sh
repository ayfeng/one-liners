if [[ $# -lt 1 ]]; then
    echo "Usage: $(basename $0) FILE"
fi

sort -t . -k 3,3n -k 4,4n $1
