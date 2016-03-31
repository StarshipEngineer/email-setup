#!/bin/bash

cp /etc/dovecot/conf.d/10-ssl.conf /etc/dovecot/conf.d/10-ssl.conf.BAK
cat /home/pi/email-setup/10-master.txt>>/etc/dovecot/conf.d/10-master.conf
sed -i 's:ssl = no:ssl = yes:' /etc/dovecot/conf.d/10-ssl.conf