#!/bin/bash

if [ $# -lt 2 ]; 
then
    echo "2 parameters required."
    echo "first parameter is a full-path of a file, second parameter is a string to be written."
    echo "error - program terminated."
    exit 1
else
    filepath=$1
    writestr=$2

    pathname=`dirname $filepath`
    filename=`basename $filepath`

    if [ ! -d $pathname ]; 
    then
    	echo "directory doesn't exit. it will be created."
    	mkdir -p $pathname
    fi
    echo $writestr > $filepath

    if [ $? -ne 0 ]; 
    then
    	echo "error occurs during file writing."
    	exit 1
    else
	echo "file writing successful."
	exit 0
    fi
fi

# if [ $# -lt 2 ]; then
#     echo "Error"
#     exit 1
# fi

# w_file="$1"
# w_str="$2"

# mkdir -p "$(dirname "$w_file")"

# echo "$w_str" > "$w_file"

# if [ $? -ne 0 ]; then
#     echo "Error"
#     exit 1
# fi

# echo "Creates file:"
# echo "$w_file"
# echo "With content:"
# echo "$w_str"
