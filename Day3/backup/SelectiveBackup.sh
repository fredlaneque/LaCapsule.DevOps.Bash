#!/bin/bash

# Demander à l'utilisateur les types de fichiers à sauvegarder
read -p "Entrez les extensions de fichiers à sauvegarder (séparées par un espace) : " extensions

# Créer le dossier de sauvegarde si nécessaire
mkdir -p backup

# Boucler sur chaque extension et copier les fichiers correspondants
for ext in $extensions; do
    find . -name "*.$ext" -exec cp {} backup/ \;
done

echo "Sauvegarde terminée."
