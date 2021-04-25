#!/bin/bash
#==========================VARIABLES==================================
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[0;33m'
BLUE='\033[0;34m'
PURPLE='\033[0;35m'
CYAN='\033[0;36m'
WHITE='\033[0;37m'
NOCOLOR='\033[0m'
URED='\033[4;31m'
UWHITE='\033[4;37m'
#=====================================================================
#echo -e "$PURPLE  ___  ___           ________ $NOCOLOR"
#echo -e "$PURPLE |\  \|\  \         |\   __  \ $NOCOLOR"
#echo -e "$PURPLE \ \  \_\  \        \ \  \_\ /_  $NOCOLOR"
#echo -e "$PURPLE  \ \   __  \        \ \   __  \ $NOCOLOR"
#echo -e "$PURPLE   \ \  \ \  \  ___   \ \  \_\  \  ___ $NOCOLOR"
#echo -e "$PURPLE    \ \__\ \__\|\__\   \ \_______\|\__\ $NOCOLOR"
#echo -e "$PURPLE     \|__|\|__|\|__|    \|_______|\|__| $NOCOLOR"
#echo -e "$PURPLE THIS SCRIPT CREATED BY HAFIFBILGILER $NOCOLOR"
#echo -e "$PURPLE ________________________________v1.1 $NOCOLOR"
#echo -e "$GREEN YOU CAN INITIATE REDIS CLUSTER ON KUBERNETES  WITH THIS SCRIPT $NOCOLOR"
#====================================================================
C=""
PN=""
LN=""
ON=""
OU=""
CN=""
Email=""
Directory=/opt/rabbitmq
CA_DRC=$Directory/CERT
RABBITMQ=/etc/rabbitmq/ssl
                  [ ! -d "$Directory" ] && mkdir $Directory
                  [ ! -d "$CA_DRC" ] && mkdir $CA_DRC
                  [ ! -d "$RABBITMQ" ] && mkdir -p $RABBITMQ
                   cd $CA_DRC
                   read -p "$(echo -e $GREEN"Country Name (2 letter code) [XX]: "$NOCOLOR)" C
                   read -p "$(echo -e $GREEN"State or Province Name (full name) []:"$NOCOLOR)" PN
                   read -p "$(echo -e $GREEN"Locality Name (eg, city) [Default City]:"$NOCOLOR)" LN
                   read -p "$(echo -e $GREEN"Organization Name (eg, company) [Default Company Ltd]:"$NOCOLOR)" ON
                   read -p "$(echo -e $GREEN"Organizational Unit Name (eg, section) []:"$NOCOLOR)" OU
                   read -p "$(echo -e $GREEN"Common Name (eg, your name or your server's hostname) []:"$NOCOLOR)" CN
                   read -p "$(echo -e $GREEN"Email Address []:"$NOCOLOR)" Email
                   openssl genrsa -out CAKey.pem 2048
                   openssl req -x509 -sha256 -new -nodes -key $PWD/CAKey.pem -days 3650 -subj "/CN=$CN/OU=$OU/O=$ON/L=$LN/ST=$PN/C=$C" -out $PWD/CACert.pem
           openssl x509 -in $PWD/CACert.pem -text
                   echo -e "$PURPLE  Started Creating Server Key $NOCOLOR"
                   sleep 2.5
                   openssl genrsa -out ServerKey.pem 2048
                   sed -i 's/CN =.*/CN = '$CN' /' $PWD/req.config
                   sed -i 's/C =.*/C = '$C' /' $PWD/req.config
                   sed -i 's/L =.*/L = '$LN' /' $PWD/req.config
                   sed -i 's/O =.*/O = '$ON' /' $PWD/req.config
                   sed -i 's/OU =.*/OU = '$OU' /' $PWD/req.config
                   read -p "$(echo -e $GREEN"Please Enter Your Subject Alternative Name []:"$NOCOLOR)" SN
                   sed -i 's/subjectAltName =.*/subjectAltName = DNS:'$SN' /' $PWD/req.config
                   openssl req -new -key $PWD/ServerKey.pem -sha256 -out $PWD/ServerCert.csr -config $PWD/req.config
                   openssl req -in $PWD/ServerCert.csr -noout -text
                   echo subjectAltName = DNS:$SN > v3.ext
                   openssl x509 -req -sha256 -in $PWD/ServerCert.csr -CA $PWD/CACert.pem -CAkey $PWD/CAKey.pem -CAcreateserial -out $PWD/ServerCert.pem -days 365 -extfile $PWD/v3.ext
                   openssl x509 -in $PWD/ServerCert.pem -text
                   cp $PWD/{ServerCert.pem,ServerKey.pem,CACert.pem} $RABBITMQ
                   chmod 666 $RABBITMQ/ServerKey.pem