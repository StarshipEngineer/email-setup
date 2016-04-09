#!/bin/bash

# A menu to select whether to add a user or exit
# Should offer a prompt to enter another user after one is entered
#main options: set up email for existing user, set up mail for new user, or exit; could do if statement for whether user is new or not

#menu box for adding new user, existing user, or quit

CHOICE=$(whiptail --title "Add user email" --menu "Setup options:" 16 78 3 \
	"01" "Set up an existing user" \
	"02" "Set up a new user" 3>&1 1>&2 2>&3)

USER=$(whiptail --inputbox "Enter the user for which to set up email:" \
8 78 --title "Add user" 3>&1 1>&2 2>&3)
exitstatus=$?
if [ $exitstatus = 0 ]; then
 whiptail --title "" --msgbox "User: $USER" 8 78
else
 whiptail --title "User" --msgbox "Cancelled" 8 78
 exit
fi

if [$CHOICE = "02"]; then
 whiptail --title "Set up new user" --msgbox "You will be asked to enter and confirm a password." 8 78
 adduser $USER
fi

cp -r /etc/skel/Maildir /home/$USER/
chown -R $USER:$USER /home/$USER/Maildir
chmod -R 700 /home/$USER/Maildir