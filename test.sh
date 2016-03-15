#!/bin/bash

sed -i -e '\$asmtp_sasl_auth_enable = yes' /etc/postfix/main.cf
sed -i -e '\$asmtpd_sasl_auth_enable = yes' /etc/postfix/main.cf