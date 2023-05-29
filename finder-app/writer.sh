#!/bin/bash

# Check if the required arguments are provided
if [ $# -lt 2 ]; then
    echo "Error: Insufficient arguments provided."
    exit 1
fi

# Extract the arguments
writefile="$1"
writestr="$2"

# Create the directory path if it doesn't exist
mkdir -p "$(dirname "$writefile")"

# Write the content to the file
echo "$writestr" > "$writefile"

# Verify if the file was created successfully
if [ $? -ne 0 ]; then
    echo "Error: Failed to create the file."
    exit 1
fi

echo "File created successfully at $writefile"

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
