#!/bin/bash

# Chemin vers le fichier de configuration
CONFIG_FILE="/home/engineer/config/config.conf"

# Demander à l'utilisateur la clé à modifier
read -p "Entrez la clé à modifier : " key

# Vérifier si la clé existe dans le fichier
if grep -q "^$key=" "$CONFIG_FILE"; then
    # Demander la nouvelle valeur
    read -p "Entrez la nouvelle valeur pour $key : " value

    # Modifier le fichier de configuration
    sed -i "s/^$key=.*/$key=$value/" "$CONFIG_FILE"

    echo "La valeur a été mise à jour."
else
    echo "Clé non trouvée."
fi
