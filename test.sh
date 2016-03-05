#!/bin/bash

# recursion test
exitstatus=0
while [ $exitstatus = 0 ]
do
	CHOICE=$(whiptail --title "Recursion test" --menu "Do you want to recur?" 16 78 3 \
	"01" "Yes - Recur" \
	"02" "No - Exit" 3>&1 1>&2 2>&3)

	case "${CHOICE}" in
		01)
		 #command
  whiptail --title "Recursion test" --infobox "You have recurred." 8 78
		;;
		02)
  exitstatus=1
		 exit
		;;
		*)
			exitstatus=1
			exit
		;;
	esac
done
