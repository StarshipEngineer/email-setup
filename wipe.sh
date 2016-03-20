apt-get remove -y postfix
apt-get remove -y dovecot-core
apt-get remove -y dovecot-imapd
rm -r /etc/postfix
rm -r /etc/dovecot
rm -r /run/dovecot
rm -r /home/pi/Maildir