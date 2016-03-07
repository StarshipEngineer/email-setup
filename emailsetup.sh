#!/bin/bash

# Make component scripts executable
chmod +x setup.sh
chmod +x adduser.sh

exitstatus=0
while [ $exitstatus = 0 ]
do
	CHOICE=$(whiptail --title "Recursion test" --menu "Do you want to recur?" 16 78 3 \
	"01" "Setup email" \
	"02" "Add an existing user" \
	"03" "Add a new user" \
	"04" "Remove email" 3>&1 1>&2 2>&3)

	case "${CHOICE}" in
		01)
		 #command
		 whiptail --title "Setup email" --infobox "1" 8 78
		;;
		02)
		 whiptail --title "Add an existing user" --infobox "2" 8 78
		;;
		03)
		 whiptail --title "Add a new user" --infobox "3" 8 78
		;;
		04)
		 whiptail --title "Remove email" --infobox "4" 8 78
		;;
		*)
			exitstatus=1
			exit
		;;
	esac
done

askreboot() {
	if (whiptail --title "Reboot" --yesno --defaultno "Would you like to reboot now?" 8 78) then
		whiptail --title "Reboot" --msgbox "The system will reboot." 8 78
		reboot
	fi
}


exitstatus=0
while [ $exitstatus = 0 ]
do
	CHOICE=$(whiptail --title "OpenVPN-Setup" --menu "Setup options:" 16 78 3 \
	"01" "Setup OpenVPN on your system" \
	"02" "Generate a client profile with MakeOVPN" \
	"03" "Remove OpenVPN and revert your system to a pre-installation state" 3>&2 2>&1 1>&3)

	case "${CHOICE}" in
		01)
			sudo chmod +x install.sh
			sudo ./install.sh
			askreboot
		;;
		02)
			./MakeOVPN.sh
		;;
		03)
			sudo ./remove.sh
			askreboot
		;;
		*)
			exitstatus=1
			exit
		;;
	esac
done
