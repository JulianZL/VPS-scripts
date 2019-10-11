#!/bin/bash

#install semanage
yum -y install policycoreutils-python

#back up ssh config
TIMESTAMP=$(date +'%m_%d_%Y-%H_%M_%S')
cp /etc/ssh/sshd_config /etc/ssh/ssh_config.bkp.$TIMESTAMP

#change ssh port
sed -i -e "/Port /c\Port 10022" /etc/ssh/sshd_config
echo -e "Restarting SSH in 5 seconds. Please wait.\n"
sleep 5
echo ""
echo -e "The SSH port has been changed to 10022. Please login using that port to test.\n"

#update SELinux
echo -e "Update SELinux for port change.\n"
semanage port -a -t ssh_port_t -p tcp 10022
sleep 5
semanage port -l|grep ssh

#update firewall
echo -e "Update firewall for port change.\n"
firewall-cmd --permanent --add-port=10022/tcp
firewall-cmd --reload

#
systemctl restart sshd
systemctl restart firewalld.service
