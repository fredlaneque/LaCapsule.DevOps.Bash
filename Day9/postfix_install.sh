#!/bin/bash

# Vérifiez si l'utilisateur est root
if [ "$(id -u)" != "0" ]; then
   echo "Ce script doit être exécuté en tant que root" 1>&2
   exit 1
fi

# Installer Postfix et Mailutils
apt-get update
apt-get install postfix mailutils -y

# Demander les informations SMTP à l'utilisateur
read -p "Entrez votre nom de domaine (ex: yourdomain.com): " mydomain
read -p "Entrez votre adresse de serveur SMTP (ex: smtp.yourmailprovider.com): " smtp_server
read -p "Entrez le port SMTP de votre serveur (ex: 587): " smtp_port
read -p "Entrez votre nom d'utilisateur SMTP: " smtp_username
read -sp "Entrez votre mot de passe SMTP: " smtp_password
echo

# Configurer Postfix
postconf -e "myhostname = mail.$mydomain"
postconf -e "mydomain = $mydomain"
postconf -e "myorigin = \$mydomain"
postconf -e "relayhost = [$smtp_server]:$smtp_port"
postconf -e "smtp_use_tls = yes"
postconf -e "smtp_sasl_auth_enable = yes"
postconf -e "smtp_sasl_security_options = noanonymous"
postconf -e "smtp_sasl_password_maps = hash:/etc/postfix/sasl_passwd"
postconf -e "mydestination = \$myhostname, localhost.\$mydomain, \$mydomain"
postconf -e "inet_interfaces = all"

# Configurer l'authentification SMTP
echo "[$smtp_server]:$smtp_port $smtp_username:$smtp_password" > /etc/postfix/sasl_passwd
chmod 600 /etc/postfix/sasl_passwd
postmap /etc/postfix/sasl_passwd

# Redémarrer Postfix
systemctl restart postfix

echo "Configuration de Postfix terminée."