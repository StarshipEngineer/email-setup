#!/bin/bash

sed -i "/#smtps/csmtps inet n - - - - smtpd" /etc/postfix/master.cf