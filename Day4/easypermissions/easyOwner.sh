#!/bin/bash

echo "Files to update :" && read -p '> ' -a files

echo "New owner and group :" && read -p '> ' owner

for file in "${files[@]}"
do
    sudo chown $owner:$owner $file
    echo "$file owner changed to $owner"
done