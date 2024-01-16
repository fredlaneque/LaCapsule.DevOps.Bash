#!/bin/bash

 if [ $# -eq 0 ]; then
     echo "Please provide a file path."
     exit 1
 fi

 FILE="$1"

 if [ ! -e "$FILE" ]; then
     echo "$FILE does not exist"
     exit 1
 fi

 PERMS=$(ls -l "$FILE" | awk '{print $1}')

 echo "File: $FILE"
 echo "Permissions: $PERMS"

 echo -e "\n\tREAD\tWRITE\tEXECUTE"
 echo -e "USER\t$([ ${PERMS:1:1} == "r" ]; echo $?)\t$([ ${PERMS:2:1} == "w" ]; echo $?)\t$([ ${PERMS:3:1} == "x" ]; echo $?)"
 echo -e "GROUP\t$([ ${PERMS:4:1} == "r" ]; echo $?)\t$([ ${PERMS:5:1} == "w" ]; echo $?)\t$([ ${PERMS:6:1} == "x" ]; echo $?)"
 echo -e "OTHER\t$([ ${PERMS:7:1} == "r" ]; echo $?)\t$([ ${PERMS:8:1} == "w" ]; echo $?)\t$([ ${PERMS:9:1} == "x" ]; echo $?)"