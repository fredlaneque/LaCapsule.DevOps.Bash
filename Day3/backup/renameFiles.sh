#!/bin/bash

# Check if user provided argument
if [ "$#" -ne 1 ]; then
	echo "You need to provide extension"
	exit 1
fi

# Extension fournie
targetExt=$1

# Get the date
today=$(date +%Y-%m-%d)

# Make destination directory if doesnt exist
mkdir -p renamedPictures

# Rename and move files
for file in picturesToRename/*.$targetExt
do
	# Get file's base name
	baseName=$(basename "$file" .$targetExt)

	# Make new path with new name
	newPath="renamedPictures/$today-$baseName.$targetExt"

	# Copy files to new destination directory with new name
	cp "$file" "$newPath"
done
