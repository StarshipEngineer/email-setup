#!/bin/bash

cd /etc/postfix



#sed -i -e "\$a/
    #smtpd_recipient_restrictions =
    #permit_sasl_authenticated,
    #permit_mynetworks,
    #reject_unauth_destination" main.cf

cp /home/pi/email-setup/helo_access.txt helo_access

postmap /etc/postfix/helo_access
service postfix restart
