#!/bin/bash

# PATH to log file
LOG_FILE="/home/engineer/logs/log.log"

# Initiate counts
error_count=0
info_count=0
warning_count=0

# Read lines one by one
while read line; do
    if [[ "$line" == *"ERROR"* ]]; then
        ((error_count++))
    elif [[ "$line" == *"INFO"* ]]; then
        ((info_count++))
    elif [[ "$line" == *"WARNING"* ]]; then
        ((warning_count++))
    fi
done < "$LOG_FILE"

# Print resume
echo "Nombre d'erreurs: $error_count"
echo "Nombre d'informations: $info_count"
echo "Nombre d'avertissements: $warning_count"
