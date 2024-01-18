#!/bin/bash

# Fonction pour valider une adresse IP
validate_ip() {
    if [[ $1 =~ ^[0-9]+\.[0-9]+\.[0-9]+\.[0-9]+$ ]]; then
        return 0
    else
        echo "Adresse IP invalide : $1"
        return 1
    fi
}

# Fonction pour configurer l'interface réseau
configure_network() {
    local interface=$1
    local ip_address=$2
    local netmask=$3
    local gateway=$4
    local dns=$5

    # Validation des adresses IP
    validate_ip $ip_address
    validate_ip $gateway
    if [ $? -ne 0 ]; then
        return 1
    fi

    # Configuration de l'interface réseau
    echo "Configuration de l'interface $interface..."
    sudo ifconfig $interface $ip_address netmask $netmask
    sudo route add default gw $gateway $interface
    echo "nameserver $dns" | sudo tee /etc/resolv.conf > /dev/null

    echo "Configuration réseau appliquée."
}

# Lecture des paramètres depuis un fichier ou l'entrée utilisateur
if [ -f "network_config.txt" ]; then
    echo "Lecture des paramètres depuis network_config.txt..."
    source network_config.txt
else
    read -p "Entrez le nom de l'interface : " interface
    read -p "Entrez l'adresse IP : " ip_address
    read -p "Entrez le masque de sous-réseau : " netmask
    read -p "Entrez la passerelle : " gateway
    read -p "Entrez le serveur DNS : " dns
fi

# Application de la configuration
configure_network $interface $ip_address $netmask $gateway $dns