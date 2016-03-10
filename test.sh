#!/bin/bash

sed -i -e "\$asmtpd_recipient_restrictions = permit_sasl_authenticated, permit_mynetworks, reject_unauth_destination"

#cat<< EOF >>