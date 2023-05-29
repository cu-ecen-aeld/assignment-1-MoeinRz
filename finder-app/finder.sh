#!/bin/bash

# Check if the required arguments are provided
if [ $# -lt 2 ]; then
    echo "Error: Insufficient arguments provided."
    exit 1
fi

# Extract the arguments
filesdir="$1"
searchstr="$2"

# Check if filesdir is a directory
if [ ! -d "$filesdir" ]; then
    echo "Error: filesdir is not a valid directory."
    exit 1
fi

# Function to count the number of matching lines in a file
count_matching_lines() {
    local file="$1"
    local search="$2"
    local line_count=0

    while IFS= read -r line; do
        if [[ $line == *"$search"* ]]; then
            ((line_count++))
        fi
    done < "$file"

    echo "$line_count"
}

# Function to recursively search for the searchstr in files
search_files() {
    local dir="$1"
    local search="$2"
    local file_count=0
    local line_count=0

    # Loop through all files and directories in the given directory
    for entry in "$dir"/*; do
        if [ -f "$entry" ]; then
            # If entry is a file, count it and search for searchstr
            ((file_count++))
            ((line_count += $(count_matching_lines "$entry" "$search")))
        elif [ -d "$entry" ]; then
            # If entry is a directory, recursively search within it
            subdir_count=0
            subline_count=0
            search_files "$entry" "$search"
            ((file_count += subdir_count))
            ((line_count += subline_count))
        fi
    done

    # Print the file and line count
    echo "The number of files are $file_count and the number of matching lines are $line_count"
}

# Call the search_files function with the provided arguments
search_files "$filesdir" "$searchstr"

# if [ $# -lt 2 ]; then
#     echo "Error"
#     exit 1
# fi

# direct="$1"
# word="$2"

# if [ ! -d "$direct" ]; then
#     echo "Error"
#     exit 1
# fi

# count_matching_lines()
# {
#     local file="$1"
#     local search="$2"
#     local line_count=0

#     while IFS= read -r line; do
#         if [[ $line == *"$search"* ]]; then
#             ((line_count++))
#         fi
#     done < "$file"

#     echo "$line_count"
# }

# search_files()
# {
#     local dir="$1"
#     local search="$2"
#     local file_count=0
#     local line_count=0

#     for entry in "$dir"/*; do
#         if [ -f "$entry" ]; then
#             ((file_count++))
#             ((line_count += $(count_matching_lines "$entry" "$search")))
#         elif [ -d "$entry" ]; then
#             subdir_count=0
#             subline_count=0
#             search_files "$entry" "$search"
#             ((file_count += subdir_count))
#             ((line_count += subline_count))
#         fi
#     done

#     echo "The number of files are $file_count and the number of matching lines are $line_count"
# }

# search_files "$direct" "$word"
