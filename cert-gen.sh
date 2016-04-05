#!/bin/bash

openssl genrsa -out <filename for your private key>.key 4096

openssl req -new -key <filename for your private key>.key -out <filename for the CSR>.csr

cd ~ wget http://www.cacert.org/certs/root.txt sudo cp root.txt /etc/ssl/certs/cacert-root.crt