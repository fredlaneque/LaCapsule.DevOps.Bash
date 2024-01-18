#!/bin/bash
# Script de Scan de Ports et Analyse de Sécurité  Objectif : Développer un script Bash 
# pour scanner les ports ouverts sur un ou plusieurs serveurs.

# Fichier contenant les adresses IP ou noms d'hôte à scanner
HOSTS_FILE="hosts.txt"

# Fichier de rapport
REPORT_FILE="scan_report.txt"

# Fonction pour scanner les ports d'un hôte
scan_ports() {
    echo "Scan de l'hôte : $1"
    echo "Résultats pour l'hôte : $1" >> $REPORT_FILE
    nmap -sV $1 | grep 'open' >> $REPORT_FILE
    echo "---------------------------------" >> $REPORT_FILE
}

# Vérifier si le fichier hosts.txt existe
if [ ! -f "$HOSTS_FILE" ]; then
    echo "Le fichier $HOSTS_FILE n'existe pas."
    exit 1
fi

# Vider le fichier de rapport
> $REPORT_FILE

# Lire le fichier hosts.txt et scanner chaque hôte
while read -r host
do
    scan_ports "$host"
done < "$HOSTS_FILE"

echo "Scan terminé. Rapport généré : $REPORT_FILE"