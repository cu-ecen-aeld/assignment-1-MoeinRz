#!/bin/bash

# error handling on parameter counts less than 2. 
if [ $# -lt 2 ]; 
then
    echo "2 parameters required. first parameter is for a directory, second parameter is for a search string."
    echo "error - program terminated."
    exit 1
else
    filesdir=$1
    searchstr=$2

# error handling, if the first parameter isn't a directory.
    if [ ! -d "$filesdir" ]; 
    then
    	echo "first parameter '$filesdir' : not a directory."
    	echo "error - program terminated."
	exit 1
    else

# file and string counts(duplication is subtracted).
	raw01=`find $filesdir | xargs grep -rch $searchstr`
	raw02=`find $filesdir -type f | xargs grep -rch $searchstr`

	for var in $raw01
	do
		if [ $var -ne 0 ];
		then
			filecnt01=$((filecnt01+1))
			stringcnt01=$((stringcnt01+var))
		fi
	done

	for var in $raw02
        do
                if [ $var -ne 0 ];
                then
                        filecnt02=$((filecnt02+1))
                        stringcnt02=$((stringcnt02+var))
                fi
        done

# output the search result.
	echo "The number of files are $((filecnt01-filecnt02)) and the number of matching lines are $((stringcnt01-stringcnt02))."
    	echo "program execution completed."
    fi
fi


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
