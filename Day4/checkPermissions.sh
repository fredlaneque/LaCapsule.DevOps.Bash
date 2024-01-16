#!/bin/bash

# Vérifie si le chemin du fichier a été fourni
if [ $# -ne 1 ]; then
    echo "Usage: $0 <file path>"
    exit 1
fi

FILE="$1"  # Le chemin du fichier est le premier argument du script

# Vérifie si le fichier existe
if [ ! -e "$FILE" ]; then
    echo "$FILE does not exist"
    exit 1
fi

# Vérifie les droits d'exécution
if [ -x "$FILE" ]; then
    echo "You have permissions to execute $FILE"
else
    echo "You do not have permissions to execute $FILE"
fi