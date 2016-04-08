#!/bin/bash

USER=$(whiptail --inputbox "Enter the existing user to set up email for:" \
8 78 --title "Add user" 3>&1 1>&2 2>&3)
exitstatus=$?
if [ $exitstatus = 0 ]; then
 whiptail --title "" --msgbox "User: $USER" 8 78
else
 whiptail --title "User" --msgbox "Cancelled" 8 78
 exit
fi

FILENAME=$(whiptail --inputbox "Enter the name for the cert:" \
8 78 --title "Cert filename" 3>&1 1>&2 2>&3)
exitstatus=$?
if [ $exitstatus = 0 ]; then
 whiptail --title "" --msgbox "User: $USER" 8 78
else
 whiptail --title "User" --msgbox "Cancelled" 8 78
 exit
fi

openssl genrsa -out $FILENAME.key 4096

openssl req -new -key $FILENAME.key -out $FILENAME.csr

cd ~ wget http://www.cacert.org/certs/root.txt sudo cp root.txt /etc/ssl/certs/cacert-root.crt

c_rehash /etc/ssl/certs

service postfix reload


#Move files
/etc/ssl/private/samhobbs.key
/etc/ssl/certs/samhobbs.crt

#Set ownership & permissions
chown root:root /etc/ssl/private/samhobbs.key
chmod 600 /etc/ssl/private/samhobbs.key
chown root:root /etc/ssl/certs/samhobbs.crt
chmod 644 /etc/ssl/certs/samhobbs.crt
