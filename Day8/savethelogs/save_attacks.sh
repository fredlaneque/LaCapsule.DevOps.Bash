#!/bin/bash

# Fichier de logs à analyser (remplacez par le chemin complet)
LOG_FILE="auth.log"

# Identifiants
dbUser="developer"
dbName="security"

# Utilisez la commande grep pour extraire les lignes contenant "Invalid user"
grep "Invalid user" "$LOG_FILE" | awk '{print $10}' | sort -u > ips.txt

# Assurez-vous que vous avez installé geoiplookup ou geoiplookup6 pour obtenir les informations sur le pays
# Utilisez la commande awk pour itérer sur les adresses IP et obtenir les pays d'origine
while read -r ip; do
  country=$(geoiplookup "$ip" | awk -F ": " '{print $2}')
  psql -U "$dbUser" -h localhost -d "$dbName" -c "INSERT INTO attacks (ip) VALUES ('$ip');"
  echo "Adresse IP: $ip, Pays: $country"
  # Enregistrez ces informations dans une base de données ici
done < ips.txt

# Supprimez le fichier temporaire contenant les adresses IP
rm ips.txt