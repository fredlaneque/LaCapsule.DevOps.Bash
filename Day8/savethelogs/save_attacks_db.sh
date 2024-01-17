#!/bin/bash

# Fichier de logs à analyser
LOG_FILE="auth.log"

# Assurez-toi d'être connecté à la bdd "security"
DB_USER="developer"
DB_NAME="security"

# Utilise la commande grep pour extraire les lignes contenant "Invalid user"
grep "Invalid user" "$LOG_FILE" | awk '{print $10}' | sort -u > attacks.txt

# Crée une variable pour stocker toutes les insertions
insertions=""

# Boucle pour construire les instructions d'insertion
while read -r ip; do
  # Utilise geoiplookup pour obtenir le pays à partir de l'adresse IP
  country=$(geoiplookup "$ip" | awk -F ": " '{print $2}')
  # Ajoute cette insertion à la variable
  insertions+="INSERT INTO attacks (ip, country) VALUES ('$ip', '$country');"
done < attacks.txt

# Exécute toutes les insertions en une seule transaction
psql -U "$DB_USER" -d "$DB_NAME" -c "$insertions"

# Supprime le fichier temporaire contenant les adresses IP et les pays
rm attacks.txt