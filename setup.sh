#!/usr/bin/bash

# Make component scripts executable
chmod +x adduser.sh

apt-get update
apt-get -y upgrade
apt-get -y install postfix

cd /etc/postfix/

# Back up files
cp main.cf main.cf.BAK
cp master.cf master.cf.BAK


# Add changes to main 
sed -i -e "\$ainet_protocols = ipv4" main.cf

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

service postfix restart

# More changes to main
sed -i -e "\$ahome_mailbox = Maildir/" main.cf
sed -i -e "\$amailbox_command =" main.cf

apt-get -y install dovecot-common dovecot-imapd

#currently here

# Add users; must be called from /etc/postfix? Check openvpnsetup

maildirmake.dovecot /etc/skel/Maildir
maildirmake.dovecot /etc/skel/Maildir/.Drafts
maildirmake.dovecot /etc/skel/Maildir/.Sent
maildirmake.dovecot /etc/skel/Maildir/.Spam
maildirmake.dovecot /etc/skel/Maildir/.Trash
maildirmake.dovecot /etc/skel/Maildir/.Templates

./adduser.sh

