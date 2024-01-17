#!/bin/bash

# Verifier le nombre d'arguments
if [ $# -ne 1 ]; then
    echo "Usage : $0 <table_name>"
    exit 1
fi

# Recup le nom de la table depuis les arguments
tableName=$1

# Nom du fichier de sauvegarde
dumpFilename="${tableName}_exported_dump.sql"

# Identifiants de connexion
dbUser="fred"
dbName="autodump"

# Exporter la table
pg_dump -U $dbUser -h localhost -d $dbName -t $tableName -f $dumpFilename

# Verifier l'export
if [ $? -eq 0 ]; then
    echo "La table $tableName a été exportée avec succès dans $dumpFilename"
else
    echo "Erreur lors de l'export de la table $tableName"
fi