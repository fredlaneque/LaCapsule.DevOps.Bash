#!/bin/bash
#
# Script de Surveillance de Réseau  Objectif : Écrire un script Bash qui surveille 
# la disponibilité des serveurs ou des dispositifs réseau.
#
# Fichier contenant les hôtes à surveiller
HOSTS_FILE="hosts.txt"
#
# E-mail pour les notifications
EMAIL="justdoit08@hotmail.fr"
#
# Fonction pour vérifier la disponibilité d'un hôte
check_host() {
    if ping -c 1 $1 &> /dev/null
    then
        echo "$1 est en ligne."
    else
        echo "$1 est hors ligne."
        # Envoyer une notification par e-mail
        echo "$1 est hors ligne" | mail -s "Alerte Hôte Hors Ligne" $EMAIL >> log.txt
    fi
}
#
# Lire le fichier hosts.txt et vérifier chaque hôte
while read -r host
do
    check_host "$host"
done < "$HOSTS_FILE"
