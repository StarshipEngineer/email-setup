#!/bin/bash

apt-get update
apt-get -y install apache2

a2enmod ssl

a2ensite default-ssl

service apache2 reload

apt-get -y update
apt-get -y install squirrelmail

squirrelmail-configure

ln -s /etc/squirrelmail/apache.conf /etc/apache2/conf-enabled/squirrelmail.conf

service apache2 reload

#currently here