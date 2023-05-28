#!/bin/bash

if [ $# -lt 2 ]; then
    echo "Error"
    exit 1
fi

direct="$1"
word="$2"

if [ ! -d "$direct" ]; then
    echo "Error"
    exit 1
fi

count_matching_lines()
{
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

search_files()
{
    local dir="$1"
    local search="$2"
    local file_count=0
    local line_count=0

    for entry in "$dir"/*; do
        if [ -f "$entry" ]; then
            ((file_count++))
            ((line_count += $(count_matching_lines "$entry" "$search")))
        elif [ -d "$entry" ]; then
            subdir_count=0
            subline_count=0
            search_files "$entry" "$search"
            ((file_count += subdir_count))
            ((line_count += subline_count))
        fi
    done

    echo "The number of files are $file_count and the number of matching lines are $line_count"
}

search_files "$direct" "$word"
