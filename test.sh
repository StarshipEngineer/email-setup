#!/bin/bash

sed -i "6c \ssl = yes" /etc/dovecot/conf.d/10-ssl.conf
sed -i "49c \ssl_protocols = !SSLv2 !SSLv3" /etc/dovecot/conf.d/10-ssl.conf