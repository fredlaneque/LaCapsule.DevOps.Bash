#!/bin/bash

echo "Files to update : " && read -p '> ' -a files

echo "New permission : " && read -p '> ' permission

for file in "${files[@]}"
do
    sudo chmod $permission $file
    echo "$file permissions changed to $permission"
done