#!/bin/bash

#

cat /home/pi/email-setup/configs/apache.txt>>/etc/squirrelmail/apache.conf

a2enmod rewrite

service apache2 reload