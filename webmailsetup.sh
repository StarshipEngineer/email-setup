#!/bin/bash

apt-get update
apt-get -y install apache2

a2enmod ssl

a2ensite default-ssl

service apache2 reload

apt-get -y update
apt-get -y install squirrelmail

squirrelmail-configure

#currently here