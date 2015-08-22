#!/bin/bash

USAGE="Usage: import_certs.sh initial# final# AZ password"
if [ $# -lt 4 ] ; then
echo $USAGE
exit 1;
fi

AZ=$3
password=$4
for i in $(seq $1 $2); do
echo " ******************************* "
if [ $i -lt 10 ]
then
echo "Adding Cas10$iA Private Key"
echo " "
/usr/java/jdk1.7.0_51/bin/keytool -importkeystore -srckeystore "Cas10$i$AZ Private Key.p12" -srcstoretype pkcs12 -srcalias "Cas10$i$AZ Private Key" -destkeystore keystore.jks -deststoretype jks -deststorepass "$password" -destalias "Cas10$i$AZ Private Key" -srcstorepass "$password"
else
echo "Adding Cas1$iA Private Key"
echo " "
/usr/java/jdk1.7.0_51/bin/keytool -importkeystore -srckeystore "Cas1$i$AZ Private Key.p12" -srcstoretype pkcs12 -srcalias "Cas1$i$AZ Private Key" -destkeystore keystore.jks -deststoretype jks -deststorepass "$password" -destalias "Cas1$i$AZ Private Key" -srcstorepass "$password"
fi
done
