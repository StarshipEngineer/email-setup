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
		 whiptail --title "Setup email" --msgbox "sets up email" 8 78
		 ./install.sh
		;;
		02)
		 whiptail --title "Add a user" --msgbox "adds user" 8 78
		 ./addacct.sh
		;;
		03)
		 whiptail --title "Remove email" --msgbox "removes email" 8 78
		;;
		*)
			exitstatus=1
			exit
		;;
	esac
done

#options: set up new cert, install webmail, all, or core