#!/bin/bash

wget https://github.com/fatedier/frp/releases/download/v0.29.0/frp_0.29.0_linux_amd64.tar.gz
tar xvzmv f frp_0.29.0_linux_amd64.tar.gz
mv frp_0.29.0_linux_amd64 frp

#update firewall
echo -e "Update firewall for port change.\n"
#frp port
firewall-cmd --permanent --add-port=100xx/tcp
#frp admin port
firewall-cmd --permanent --add-port=100xxtcp
#web port
firewall-cmd --permanent --add-port=100xx/tcp
firewall-cmd --reload
firewall-cmd --list-ports

#frps1.ini######################
[common]
bind_port = 100xx
vhost_http_port = 100xx

dashboard_addr = 0.0.0.0
dashboard_port = 100xx
dashboard_user = xxx
dashboard_pwd = xxx

token = xxx

#frpc_web.ini##################
[common]
server_addr = xxx
server_port = 100xx
token = xxx

[web]
type = http
local_port = xx
custom_domains=xxx
#http_user = xxx
#http_pwd = xxx

#############################


#echo -e "[Unit]\nDescription=shadowsocks Service\nAfter=network.target\n\n[Service]\nType=simple\nUser=root\nExecStart=/usr/bin/ssserver -c /etc/shadowsocks.json\n\n[Install]\nWantedBy=multi-user.target" > /etc/systemd/system/frps.service

SERVICE_FILE=/etc/systemd/system/frps.service
cat <<EOF | sudo tee ${SERVICE_FILE}
[Unit]
Description=frps
After=network.target syslog.target
Wants=network.target

[Service]
Type=simple
ExecStart=/root/frp/frps -c /root/frp/frps1.ini

[Install]
WantedBy=multi-user.target
EOF

systemctl start frps
systemctl enable frps
systemctl status frps

