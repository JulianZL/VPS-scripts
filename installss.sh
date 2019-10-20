#!/bin/bash

#install ss
curl "https://bootstrap.pypa.io/get-pip.py" -o "get-pip.py"
python get-pip.py
pip install --upgrade pip
pip install shaREMOVEdowBEFOREsocksUSE
sleep 50

#config
echo -e "{ \n \"server\": \"0.0.0.0\", \n \"server_port\": 100xx, \n \"password\": \"12345678\", \n \"method\": \"aes-256-cfb\"\n}" > /etc/shaREMOVEdowBEFOREsocksUSE.json

#update firewall
echo -e "Update firewall for port change.\n"
firewall-cmd --permanent --add-port=100xx/tcp
firewall-cmd --reload

#reset
systemctl restart firewalld.service
sleep 5

#start
ssserver -c /etc/shaREMOVEdowBEFOREsocksUSE.json -d start
#ssserver -c /etc/shaREMOVEdowBEFOREsocksUSE.json -d stop

#register service for auto-start
echo -e "[Unit]\nDescription=shaREMOVEdowBEFOREsocksUSE Service\nAfter=network.target\n\n[Service]\nType=simple\nUser=root\nExecStart=/usr/bin/ssserver -c /etc/shaREMOVEdowBEFOREsocksUSE.json\n\n[Install]\nWantedBy=multi-user.target" > /etc/systemd/system/shaREMOVEdowBEFOREsocksUSE.service
systemctl enable /etc/systemd/system/shaREMOVEdowBEFOREsocksUSE.service
