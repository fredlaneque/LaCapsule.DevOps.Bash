#!/bin/bash

if [ $# -eq 0 ]; then
    echo "Please provide a directory path."
    exit 1
fi

DIR="$1"
if [ ! -d "$DIR" ]; then
    echo "$DIR is not a directory"
    exit 1
fi

for FILE in "$DIR"/*; do
    if [ -e "$FILE" ]; then
        PERMS=$(ls -l "$FILE" | awk '{print $1}')
        echo "File: $(basename "$FILE")"
        echo "Permissions: $PERMS"
        echo -e "\tREAD\tWRITE\tEXECUTE"
        echo -e "USER\t$([ ${PERMS:1:1} == "r" ]; echo $?)\t$([ ${PERMS:2:1} == "w" ]; echo $?)\t$([ ${PERMS:3:1} == "x" ]; echo $?)"
        echo -e "GROUP\t$([ ${PERMS:4:1} == "r" ]; echo $?)\t$([ ${PERMS:5:1} == "w" ]; echo $?)\t$([ ${PERMS:6:1} == "x" ]; echo $?)"
        echo -e "OTHER\t$([ ${PERMS:7:1} == "r" ]; echo $?)\t$([ ${PERMS:8:1} == "w" ]; echo $?)\t$([ ${PERMS:9:1} == "x" ]; echo $?)"
        echo
    fi
done