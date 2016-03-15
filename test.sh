#!/bin/bash

sed -i '\$asmtp_sasl_auth_enable = yes' /etc/postfix/main.cf
sed -i '\$asmtpd_sasl_auth_enable = yes' /etc/postfix/main.cf