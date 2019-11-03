# vi /etc/ssh/sshd_config
#ClientAliveInterval 0
#ClientAliveCountMax 3
#change to
#ClientAliveInterval 60
#ClientAliveCountMax 5
#LoginGraceTime 0 #2m
#TCPKeepAlive yes
systemctl restart sshd
