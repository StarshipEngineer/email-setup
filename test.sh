#!/bin/bash

#sed -i "29c \  -o syslog_name=postfix/smtps" /etc/postfix/master.cf
sed -i "31i \  -o smtpd_recipient_restrictions=permit_sasl_authenticated,reject" /etc/postfix/master.cf
