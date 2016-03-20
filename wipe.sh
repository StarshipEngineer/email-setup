apt-get remove -y postfix
apt-get remove -y dovecot
rm -r /etc/postfix
rm -r /etc/dovecot
rm -r /run/dovecot
rm -r /home/pi/Maildir
rm -r /etc/skel