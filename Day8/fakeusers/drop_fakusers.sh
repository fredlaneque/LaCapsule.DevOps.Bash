#!/bin/bash

# Paramètres de connexion à la base de données
DB_NAME="fakeusers"
DB_USER="developer"
DB_PASSWORD="keiko"
DB_HOST="localhost"

# Emplacement du fichier blacklist.csv
BLACKLIST_FILE="blacklist.csv"

# Lire chaque ligne du fichier blacklist et exécuter la suppression
while IFS= read -r domain
do
    # Supprimer les utilisateurs avec des emails de ce domaine
    PGPASSWORD=$DB_PASSWORD psql -U $DB_USER -h $DB_HOST -d $DB_NAME -c "DELETE FROM users WHERE email LIKE '%$domain%';"
done < "$BLACKLIST_FILE"

echo "Suppression des utilisateurs terminée."