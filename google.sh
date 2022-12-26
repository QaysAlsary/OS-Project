#!/bin/bash


echo "Please enter the files/directories to search for use spaces as separators: "
read -a search_list


cache_file="search_cache.txt"


for search_item in "${search_list[@]}"
do
    
    if grep -q "$search_item" "$cache_file"; then
        
        result=$(grep "$search_item" "$cache_file")
    else
        
        result=$(find . -name "$search_item" -exec ls -l {} \;)
        if [ -z "$result" ]
        then
        echo "No results found for $search_item"
        else
        
        echo "$search_item:$result" >> "$cache_file"
    fi
    fi
    
    echo "$result" | awk '{print $1, $2, $3}'
done
