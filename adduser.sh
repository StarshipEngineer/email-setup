#!/bin/bash

# A menu to select whether to add a user or exit
# Should offer a prompt to enter another user after one is entered
#main options: set up email for existing user, set up mail for new user, or exit

USER=$(whiptail --inputbox "Enter the existing user to set up email for:" \
8 78 --title "Add user" 3>&1 1>&2 2>&3)
exitstatus=$?
if [ $exitstatus = 0 ]; then
 whiptail --title "" --msgbox "User: $USER" 8 78
else
 whiptail --title "User" --msgbox "Cancelled" 8 78
 exit
fi

cp -r /etc/skel/Maildir /home/$USER/
chown -R $USER:$USER /home/$USER/Maildir
chmod -R 700 /home/$USER/Maildir

# idea- give an option to correct entry, or unnecessary? if it kicks back, should go back to main menu; could do yes/no box in this script to continue or re-enter
