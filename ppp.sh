﻿chkconfig iptables off
service iptables stop


==============
iptables -t nat -A POSTROUTING -o eth0 -j MASQUERADE
iptables -A INPUT -i eth0 -p tcp --dport 1723 -j ACCEPT
iptables -A INPUT -i eth0 -p gre -j ACCEPT
iptables -A FORWARD -i ppp+ -o eth0 -j ACCEPT
iptables -A FORWARD -i eth0 -o ppp+ -j ACCEPT
iptables -A OUTPUT -p tcp --dport 1723 -j ACCEPT
iptables -A OUTPUT -p gre -j ACCEPT
=============

service iptables save
service iptables start

wget https://raw.githubusercontent.com/DanylZhang/VPS/master/CentOS7-pptp-host1plus.sh


chmod +x ./CentOS7-pptp-host1plus.sh


./CentOS7-pptp-host1plus.sh -u test -p Cdlxj1028
