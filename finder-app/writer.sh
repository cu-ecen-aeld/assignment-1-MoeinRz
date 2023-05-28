#!/bin/bash

if [ $# -lt 2 ]; then
    echo "Error"
    exit 1
fi

w_file="$1"
w_str="$2"

mkdir -p "$(dirname "$w_file")"

echo "$w_str" > "$w_file"

if [ $? -ne 0 ]; then
    echo "Error"
    exit 1
fi

echo "Successfully create the file."
