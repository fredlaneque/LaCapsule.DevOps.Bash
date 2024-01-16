#!/bin/bash

# Vérifie si le chemin du répertoire a été fourni
if [ $# -eq 0 ]; then
    echo "Please provide a directory path."
    exit 1
fi

DIR="$1"  # Le chemin du répertoire est le premier argument du script

# Vérifie si le répertoire existe
if [ ! -d "$DIR" ]; then
    echo "$DIR is not a directory"
    exit 1
fi

# Compte les fichiers pour chaque propriétaire
find "$DIR" -type f -exec ls -l {} \; | awk '{print $3}' | sort | uniq -c | awk '{print $2, $1}'