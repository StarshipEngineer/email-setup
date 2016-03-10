#!/bin/bash

cd /etc/postfix

sed -i -e "\$asmtpd_recipient_restrictions =/
    permit_sasl_authenticated,/
    permit_mynetworks,/
    reject_unauth_destination" main.cf

service postfix reload

#cd /etc/postfix
#cat /home/pi/email-setup/config.txt>>main.cf