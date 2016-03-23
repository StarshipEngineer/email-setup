#!/bin/bash


sed -i ":syslog_name=postfix/smtps:c  -o syslog_name=postfix/smtps" /etc/postfix/master.cf
sed -i ":smtpd_tls_wrappermode=yes:c  -o smtpd_tls_wrappermode=yes" /etc/postfix/master.cfw