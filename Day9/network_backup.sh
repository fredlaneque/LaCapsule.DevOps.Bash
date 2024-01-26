#!/bin/bash
# Script de Backup et de Restauration de Configuration Réseau  
# Objectif : Écrire un script pour sauvegarder et restaurer les configurations réseau 
# d'un serveur ou d'un routeur
#
# Emplacement des fichiers de configuration réseau
CONFIG_DIR="/etc/network"
BACKUP_DIR="NetConfigBackup"
#
# Créer un répertoire de sauvegarde s'il n'existe pas
mkdir -p $BACKUP_DIR
#
# Fonction pour sauvegarder la configuration réseau
backup_configs() {
    echo "Sauvegarde des configurations réseau..."
    tar -czvf $BACKUP_DIR/network_configs_$(date +%Y%m%d%H%M%S).tar.gz $CONFIG_DIR
    echo "Sauvegarde terminée."
}
#
# Fonction pour restaurer la configuration réseau
restore_configs() {
    echo "Liste des sauvegardes disponibles :"
    ls -l $BACKUP_DIR/*.tar.gz
    read -p "Entrez le nom complet du fichier de sauvegarde : " backup_file

    if [ -f "$backup_file" ]; then
        tar -xzvf $backup_file -C /
        echo "Restauration terminée."
    else
        echo "Fichier de sauvegarde non trouvé."
    fi
}
#
# Vérification de l'intégrité des sauvegardes
check_integrity() {
    echo "Vérification de l'intégrité des sauvegardes..."
    gzip -t $BACKUP_DIR/*.tar.gz
    echo "Vérification terminée."
}
#
# Menu principal
echo "Script de gestion de la configuration réseau"
PS3="Choisissez une option : "
options=("Sauvegarder" "Restaurer" "Vérifier l'intégrité" "Quitter")
select opt in "${options[@]}"
do
    case $opt in
        "Sauvegarder")
            backup_configs
            ;;
        "Restaurer")
            restore_configs
            ;;
        "Vérifier l'intégrité")
            check_integrity
            ;;
        "Quitter")
            break
            ;;
        *) echo "Option invalide $REPLY";;
    esac
done