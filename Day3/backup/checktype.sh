#!/usr/bin/env bash

for path in "$@"
do
	if [ -d "$path" ]; then
		echo "$path is a directory"
	elif [ -f "$path" ]; then
		echo "$path is a regular file"
	else
		echo "$path is not a regulr file or directory"
	fi
done

exit