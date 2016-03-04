# A menu to select whether to add a user or exit
# Should offer a prompt to enter another user after one is entered
#main options: set up email for existing user, set up mail for new user, or exit

USER=$()

maildirmake.dovecot /etc/skel/Maildir
maildirmake.dovecot /etc/skel/Maildir/.Drafts
maildirmake.dovecot /etc/skel/Maildir/.Sent
maildirmake.dovecot /etc/skel/Maildir/.Spam
maildirmake.dovecot /etc/skel/Maildir/.Trash
maildirmake.dovecot /etc/skel/Maildir/.Templates

cp -r /etc/skel/Maildir /home/USER/
chown -R USER:USER /home/USER/Maildir
chmod -R 700 /home/USER/Maildir
