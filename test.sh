#!/bin/bash

cd /etc/postfix

sed -i "\$asmtp_sasl_auth_enable = yes" main.cf
sed -i "\$asmtpd_sasl_auth_enable = yes" main.cf