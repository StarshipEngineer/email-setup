
cd /etc/postfix/

sed -i -e "\$ahome_mailbox = Maildir/" main.cf
sed -i -e "\$amailbox_command =" main.cf
