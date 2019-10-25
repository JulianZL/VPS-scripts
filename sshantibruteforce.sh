#!/bin/bash

#systemctl status crond
#crontab -e
#i
#0 0 * * mon /bin/bash /root/denyhostsscript.sh
#esc, :wq
#crontab -l
systemctl restart crond
#DenyHosts
