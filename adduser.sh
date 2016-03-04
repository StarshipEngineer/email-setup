#

maildirmake.dovecot /etc/skel/Maildir
maildirmake.dovecot /etc/skel/Maildir/.Drafts
maildirmake.dovecot /etc/skel/Maildir/.Sent
maildirmake.dovecot /etc/skel/Maildir/.Spam
maildirmake.dovecot /etc/skel/Maildir/.Trash
maildirmake.dovecot /etc/skel/Maildir/.Templates

cp -r /etc/skel/Maildir /home/USER/
chown -R USER:USER /home/USER/Maildir
chmod -R 700 /home/USER/Maildir