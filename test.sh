#!/bin/bash

cd /etc/dovecot

sed -i -e '/#listen/clisten = *' dovecot.conf