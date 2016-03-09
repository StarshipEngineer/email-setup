#!/bin/bash

askreboot() {
	if (whiptail --title "Reboot" --yesno --defaultno "Would you like to reboot now?" 8 78) then
		whiptail --title "Reboot" --msgbox "The system will reboot." 8 78
		reboot
	fi
}

# Make component scripts executable
chmod +x setup.sh
chmod +x adduser.sh

exitstatus=0
while [ $exitstatus = 0 ]
do
	CHOICE=$(whiptail --title "Email setup" --menu "Setup options:" 16 78 3 \
	"01" "Setup email" \
	"02" "Add an existing user" \
	"03" "Remove email" 3>&1 1>&2 2>&3)

# add options for setting up components and full install

	case "${CHOICE}" in
		01)
		 #command
		 whiptail --title "Setup email" --msgbox "1" 8 78
		 #./setup.sh
		;;
		02)
		 whiptail --title "Add a user" --msgbox "2" 8 78
		 #./adduser.sh
		;;
		03)
		 whiptail --title "Remove email" --msgbox "4" 8 78
		;;
		*)
			exitstatus=1
			exit
		;;
	esac
done