#!/bin/bash

# Paramètres de connexion à la base de données
DB_NAME="fakeusers"
DB_USER="developer"
DB_PASSWORD="keiko"
DB_HOST="localhost"

# Emplacement du fichier CSV
CSV_FILE="userdata.csv"

# Commande pour importer les données
PGPASSWORD=$DB_PASSWORD psql -U $DB_USER -h $DB_HOST -d $DB_NAME -c "\copy users(id, firstname, lastname, email, role, created_on, last_login) FROM '$CSV_FILE' DELIMITER ',' CSV HEADER;"

echo "Importation terminée."