yum install epel-release
yum install supervisor
systemctl enable supervisord.service
#check auto-start on boot
systemctl list-unit-files