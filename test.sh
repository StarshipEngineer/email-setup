NAME=$(whiptail --inputbox "Enter your fully-qualified domain name (ex example.com):" \
8 78 --title "Setup OpenVPN" 3>&1 1>&2 2>&3)
exitstatus=$?
if [ $exitstatus = 0 ]; then
 whiptail --title "Domain Name" --infobox "Domain: $NAME" 8 78
else
 whiptail --title "Domain Name" --infobox "Cancelled" 8 78
 exit
fi

cd /etc/postfix/
sed -i '/myhostname/cmyhostname = '$NAME'' main.cf
