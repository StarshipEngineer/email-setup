#!/bin/bash

cd /etc/postfix

#sed -i -e "\$a/
    #smtpd_recipient_restrictions =
    #permit_sasl_authenticated,
    #permit_mynetworks,
    #reject_unauth_destination" main.cf

service postfix reload

cat /home/pi/email-setup/config.txt>>main.cf