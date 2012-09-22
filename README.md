WonderUserfulScripts
====================

Xinyu's useful scripts

Small Tips
====================
For Ramhost VPS, after configured the VPN server, should add the following iptable rule to the server.

iptables -t nat -A POSTROUTING -s 10.8.0.0/24 -o venet0 -j SNAT --to $YOU\_SERVER\_IP
