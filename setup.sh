#!/bin/bash

# Make component scripts executable
chmod +x adduser.sh

apt-get update
apt-get -y upgrade
apt-get -y install postfix

cd /etc/postfix/

# Back up files
cp main.cf main.cf.BAK
cp master.cf master.cf.BAK

# Enter hostname and alter main to have it
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

# Add changes to main 
cat /home/pi/email-setup/config.txt>>main.cf
#sed -i -e "\$ainet_protocols = ipv4" main.cf

service postfix restart

# More changes to main
#sed -i -e "\$ahome_mailbox = Maildir/" main.cf
#sed -i -e "\$amailbox_command =" main.cf

apt-get -y install dovecot-common dovecot-imapd

maildirmake.dovecot /etc/skel/Maildir
maildirmake.dovecot /etc/skel/Maildir/.Drafts
maildirmake.dovecot /etc/skel/Maildir/.Sent
maildirmake.dovecot /etc/skel/Maildir/.Spam
maildirmake.dovecot /etc/skel/Maildir/.Trash
maildirmake.dovecot /etc/skel/Maildir/.Templates

./adduser.sh

service postfix reload

cp /home/pi/email-setup/helo_access.txt helo_access

postmap /etc/postfix/helo_access
service postfix restart

sed -i -e '/#listen =/clisten = *' dovecot.conf

service dovecot restart

#currently here

