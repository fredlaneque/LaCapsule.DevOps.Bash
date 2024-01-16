 #!/bin/bash

 # Chemin du répertoire contenant les fichiers temporaires
 TEMP_DIR="temp_files"

 # Vérifie si le répertoire existe
 if [ ! -d "$TEMP_DIR" ]; then
     echo "Le répertoire $TEMP_DIR n'existe pas."
     exit 1
 fi

 # Récupère le nom d'utilisateur de l'utilisateur exécutant le script
 CURRENT_USER=$(whoami)

 # Parcourt tous les fichiers dans le répertoire
 for file in "$TEMP_DIR"/*; do
     # Vérifie si le fichier appartient à l'utilisateur courant
     if [ -O "$file" ]; then
         echo "Suppression de $file"
         rm "$file"
     else
         echo "Ignoré (appartient à un autre utilisateur) : $file"
     fi
 done

 echo "Nettoyage terminé."