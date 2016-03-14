#!/bin/bash

#cd /etc/dovecot

adduser testmail

service postfix restart
service dovecot restart