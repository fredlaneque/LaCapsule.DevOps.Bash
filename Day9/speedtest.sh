#!/bin/bash
# Script pour Tester la Performance du Réseau  
# Objectif : Créer un script qui teste la performance du réseau entre deux points.
#
# Configuration
SERVER_IP="192.168.1.1"  # Remplacez par l'adresse IP de votre serveur iperf
DURATION=60              # Durée du test iperf en secondes
INTERVAL=5               # Intervalle entre les tests en minutes
COUNT=10                 # Nombre de pings à envoyer
LOG_FILE="network_performance.log"
#
# Fonction pour tester la bande passante avec iperf3
test_bandwidth() {
    echo "Test de bande passante en cours..."
    iperf3 -c $SERVER_IP -t $DURATION >> $LOG_FILE
}
#
# Fonction pour tester la perte de paquets et le délai avec ping
test_ping() {
    echo "Test de ping en cours..."
    ping -c $COUNT $SERVER_IP >> $LOG_FILE
}
#
# Boucle pour effectuer les tests à intervalles réguliers
while true; do
    echo "---------------------------------" >> $LOG_FILE
    echo "Test démarré à $(date)" >> $LOG_FILE

    test_bandwidth
    test_ping

    echo "Test terminé à $(date)" >> $LOG_FILE
    echo "Attente de $INTERVAL minutes avant le prochain test..."
    sleep $(($INTERVAL * 60))
done