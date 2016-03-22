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
cat /home/pi/email-setup/main.txt>>main.cf

apt-get -y install dovecot-core dovecot-imapd

maildirmake.dovecot /etc/skel/Maildir
maildirmake.dovecot /etc/skel/Maildir/.Drafts
maildirmake.dovecot /etc/skel/Maildir/.Sent
maildirmake.dovecot /etc/skel/Maildir/.Spam
maildirmake.dovecot /etc/skel/Maildir/.Trash
maildirmake.dovecot /etc/skel/Maildir/.Templates

./adduser.sh

cp /home/pi/email-setup/helo_access.txt helo_access
postmap /etc/postfix/helo_access

#Dovecot config
sed -i -e '/#listen =/clisten = *' dovecot.conf

cp /etc/dovecot/conf.d/10-mail.conf /etc/dovecot/conf.d/10-mail.conf.BAK

cp /etc/dovecot/conf.d/10-master.conf /etc/dovecot/conf.d/10-master.conf.BAK

cp /etc/dovecot/conf.d/10-auth.conf /etc/dovecot/conf.d/10-auth.conf.BAK

#Modify dovecot config files
sed -i ':mail_location = mbox:~/mail:INBOX=/var/mail/%u:cmail_location = maildir:~/Maildir' /etc/dovecot/conf.d/10-mail.conf

cat /home/pi/email-setup/10-master.txt>>/etc/dovecot/conf.d/10-master.conf

sed -i '/disable_plaintext_auth =/cdisable_plaintext_auth= no' /etc/dovecot/conf.d/10-auth.conf
sed -i '/auth_mechanisms =/cauth_mechanisms = plain login' /etc/dovecot/conf.d/10-auth.conf

sed -i "/#smtps/csmtps inet n - - - - smtpd" /etc/postfix/master.cf

#currently here

