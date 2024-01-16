#!/bin/bash

# Get the date
today=$(date +%Y-%m-%d)

# Source directory
sourceDir=picturesToRename

# Make destination directory if doesnt exist
destDir=renamedPictures
if [ -d "$destDir" ]; then
	echo "Directory $destDir already exists."
else
	mkdir $destDir
fi

# Rename and move files
for file in "$sourceDir/*.jpg"
do
	# Get file's base name
	baseName=$(baseName "$file" .jpg)

	# Make new path with new name
	newPath="$destDir/$today-$baseName.jpg

	# Copy file to destination dictory
	cp "$file" "$newPath"
done
