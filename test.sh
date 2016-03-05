#!/usr/bin/bash

# recursion test
exitstatus=0
while [ $exitstatus = 0 ]
do
	CHOICE=$(whiptail --title "Recursion test" --menu "Do you want to recur?" 16 78 3 \
	"01" "Yes - Recur" \
	"02" "No - Exit" 2>&1 1>&2)

	case "${CHOICE}" in
		01)
		 #command
  whiptail --title "Setup OpenVPN" --msgbox "You have recurred." 8 78
		;;
		02)
		 exit
		;;
		*)
			exitstatus=1
			exit
		;;
	esac
done
