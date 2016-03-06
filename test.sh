#!/bin/bash

if (whiptail --title "Test Yes/No Box" --yesno "Choose between Yes and No." 10 60) then

    echo "You chose Yes. Exit status was $?."

else

    echo "You chose No. Exit status was $?."

fi



# recursion test
# is formal recursion necessary? This just kicks you back to main screen anyway
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
