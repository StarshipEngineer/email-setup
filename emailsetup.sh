#!/usr/bin/bash

sudo apt-get update
sudo apt-get upgrade
sudo apt-get install postfix

cd /etc/postfix/
sed -i -e "\$ainet_protocols = ipv4" main.cf

# enter hostname and alter main to have it
NAME=$(whiptail --inputbox "Enter your fully-qualified domain name (ex example.com):" \
8 78 --title "Setup OpenVPN" 3>&1 1>&2 2>&3)
exitstatus=$?
if [ $exitstatus = 0 ]; then
 whiptail --title "Domain Name" --infobox "Domain: $NAME" 8 78
else
 whiptail --title "Domain Name" --infobox "Cancelled" 8 78
 exit
fi

sed -i '/myhostname/cmyhostname = '$NAME'' main.cf

service postfix restart

sed -i -e "\$ahome_mailbox = Maildir/" main.cf
sed -i -e "\$amailbox_command =" main.cf
