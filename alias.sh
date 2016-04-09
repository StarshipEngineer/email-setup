#!/bin/bash

#set as a second line thing? or allow set or reset options?

sed -i

USER=$(whiptail --inputbox "Enter the user to be designated admin:" \
8 78 --title "Add user" 3>&1 1>&2 2>&3)
exitstatus=$?
if [ $exitstatus = 0 ]; then
 whiptail --title "" --msgbox "User: $USER" 8 78
else
 whiptail --title "User" --msgbox "Cancelled" 8 78
 exit
fi

sed -i "\$apostmaster: $USER" /etc/aliases
sed -i "\$awebmaster: $USER" /etc/aliases
sed -i "\$aroot: $USER" /etc/aliases
newaliases