#!/bin/bash

#cat /var/log/secure

systemctl status crond
#crontab -e
#i
#0 0 * * mon /bin/bash /root/denyhostsscript.sh
#esc, :wq
#file location: /var/spool/cron/root
#echo > or create by:
#cat <<EOF | sudo tee ${CONFIG_FILE}
#xxx
#EOF

crontab -l
systemctl restart crond

#cat /etc/hosts.deny

#alternative option: DenyHosts
