#!/bin/bash

# File to store passwords
PASSWORD_FILE="passwords.enc"

# Encryption key (must be stored in a safe place)
ENCRYPTION_KEY="-----BEGIN OPENSSH PRIVATE KEY-----
b3BlbnNzaC1rZXktdjEAAAAABG5vbmUAAAAEbm9uZQAAAAAAAAABAAABlwAAAAdzc2gtcn
NhAAAAAwEAAQAAAYEAnD+kJ9r/Go7QqBYe1y3RC9tsZEA7N07CJhlCqQbwXf9nziKMGo8Z
Abbdd0DEDKii99yvtrwAFaylbhcNqv1ScwhJrzqa0Fsg9MrTrroylUMsHmZReBbR9KyEzD
h3LFMoXuIWYGfWuPk/nmtoP6A+EJSFgGO+tm/WIfUOx6pdx2XcK6rKrbp+jabuEEXmnsqG
Gb2XUrvjPxASfVao7pKrZIaekNRDMEn448+7fbrvQNnfcJrJl0g213Ecf9kRVEspVkYLIG
Nhe+hR+CVp/La3VHJ3sFQEiE5xGMJi88VKhp1T44KDHjfUc1+xEbhN6rNju5NqL6iWhXH/
w9xhinQCnGoB+EqIHA1zQsF0aXvRpfBE4Z4f00XxWbq7WwjtXMrf0iIYsc+V9Huzmf1b45
xXZXAO2GRoQFr6e43JNdKsTNOeVCbPQSfpDiBWq9uMoXGzjS60ikXAzZTB1i6DUwAXdOC6
JZmZrmJi5g8DeBUAJ4UKOUSRk0PIZC8mHSmh4kFRAAAFiAG8JncBvCZ3AAAAB3NzaC1yc2
EAAAGBAJw/pCfa/xqO0KgWHtct0QvbbGRAOzdOwiYZQqkG8F3/Z84ijBqPGQG23XdAxAyo
ovfcr7a8ABWspW4XDar9UnMISa86mtBbIPTK0666MpVDLB5mUXgW0fSshMw4dyxTKF7iFm
Bn1rj5P55raD+gPhCUhYBjvrZv1iH1DseqXcdl3Cuqyq26fo2m7hBF5p7Khhm9l1K74z8Q
En1WqO6Sq2SGnpDUQzBJ+OPPu32670DZ33CayZdINtdxHH/ZEVRLKVZGCyBjYXvoUfglaf
y2t1Ryd7BUBIhOcRjCYvPFSoadU+OCgx431HNfsRG4TeqzY7uTai+oloVx/8PcYYp0Apxq
AfhKiBwNc0LBdGl70aXwROGeH9NF8Vm6u1sI7VzK39IiGLHPlfR7s5n9W+OcV2VwDthkaE
Ba+nuNyTXSrEzTnlQmz0En6Q4gVqvbjKFxs40utIpFwM2UwdYug1MAF3TguiWZma5iYuYP
A3gVACeFCjlEkZNDyGQvJh0poeJBUQAAAAMBAAEAAAGAB452YG0RcFXe1no3ZJ21IfcrL1
AB7SNUdWY8WJNa1ZjwCsKV9wTbpz8SR92sfZY8R3N3VgWSlXnDiGb6BL56mdCZS62wZgo6
NkyG30jnAFv+yruVDhNAdS5Qv9WtQcoFxkz12xS6iDiZsI4uPQGBbujX6gUo6IbRGtRQsi
xVm7qb4srAQZWm4C/mDIhs5loSETWfl2M50sdytXgW9G7IdjSif4uccj3pmQ7nWOXNA1xm
F3qM7FGUQWgZgj9bvLFjy40TRQmW+9AtemsVCCkjQ6rc95rA5PhyO+TcEPAMnAbscDrVCN
Q8vpY27oLUFeYZ8nphF9k7IPdtTlzoYqN5hHwm52qqjF2TkzGwMclBYHwG14/UhUNmb7WC
Em3OdFjSAmmUqk5JzVpB7ilmuMKM2f8DWxjcark6qeqNJXqszREJ6N5QnHKpz0jaG4UVHW
OGmUih1JBK9w7JQSgAsxlBqkmDpLTOcXwH8YUfXpMHAQYNl4dth1N5uBNbVcSNWzEpAAAA
wE/jb6KpKYFPp5/ohMldw8kLpc++6DN9n7wfec5MSAfsuyEespTNK22g2FRZOsvCLpZx2D
HRLZ5Fx5Yp4qQG7AEqN0RWOoxhxXpTCWrCNzzA8qbDulx3huxumhqtoTgw9Ytb24jJV1N3
tukgR9l71e8j1ycO+q5NYd51Qf/4eJ2hX2k19JBnIALoaeXjeKZLQDT+p1YFTjosbG4QWL
RHPs2FuwUm4v5+hmUjg1aUi2ywjL3sH8MJ24IsFG9Nzt03CwAAAMEAyrY9AKQuCLUAUmIE
EuIer4HpwumzmhJlmypgBFRnWkXxrElZtjAsZztzrR4nMHQwn+nOQBmCWQcutKQRsAG/93
1QELHIAG7vhWexUcoEVAqv6fNuec4Ib1cENXvL2o4rlmJD57RQquFhhKidJzE4gsf9bvdR
4MxciNoTmOb+jZo9OTveRvsjsMQocxZyVitmzQS1lLnxpVFiAwa+f/FphXfSWsZx1/n082
judxSyXpHrIkv6S1pLnrNsR6QeN7LdAAAAwQDFUpia2fl3EHvNNucqeRcQmHbKGd6VMtxq
KT0ld3dhM9kECKNbFbRWsgefV1jJVfLjvlIiVkJRSMAIs2KWkhIvgw6VIACZnC1VnvNQcH
yH29z3c3CGLk/4FaDwqChm9IHlHcz2xqfQudaiFgllCzzjO5sn534yMWruHwHRHMOdt7SM
QpQHwy8Yu6jCjEUvZc0RpGS2ndGNU4sfQpiYQqyEqG/AIHsMHzeqmMOSb4SAnZ4DTVBYL9
WS3/fvnor/HwUAAAAPZW5naW5lZXJAZGViaWFuAQIDBA==
-----END OPENSSH PRIVATE KEY-----"

# Encrypt password and add to file
add_password() {
    local username=$1
    local password=$2

    # Encrypt password
    encrypted_password=$(echo "$password" | openssl enc -aes-256-cbc -a -salt -pbkdf2 -pass pass:"$ENCRYPTION_KEY")

    # Add to file
    echo "$username:$encrypted_password" >> "$PASSWORD_FILE"
}

# Find password and decrypt it
get_password() {
    local username=$1
    encrypted_password=$(grep "^$username:" "$PASSWORD_FILE" | cut -d ':' -f2)

    if [ -n "$encrypted_password" ]; then
        # Decrypt password
        echo "$encrypted_password" | openssl enc -aes-256-cbc -d -a -pbkdf2 -pass pass:"$ENCRYPTION_KEY"
    else
        echo "Nom d'utilisateur introuvable."
    fi
}

# User interface
echo "Gestionnaire de mot de passe"
echo "1. Ajouter un mot de passe"
echo "2. Récupérer un mot de passe"
read -p "Choisissez une option : " option

case $option in
    1)
        read -p "Nom d'utilisateur : " username
        read -sp "Mot de passe : " password
        echo
        add_password "$username" "$password"
        ;;
    2)
        read -p "Nom d'utilisateur : " username
        get_password "$username"
        ;;
    *)
        echo "Option invalide"
        ;;
esac