cp ./interfaces.ap /etc/network/interfaces
service hostapd start
service isc-dhcp-server start
update-rc.d hostapd enable
update-rc.d isc-dhcp-server enable
#cp ./interfaces.ap /etc/network/interfaces
#service networking restart
sudo sh -c "echo 1 > /proc/sys/net/ipv4/ip_forward"
sudo iptables -t nat -A POSTROUTING -o eth0 -j MASQUERADE
sudo iptables -A FORWARD -i eth0 -o wlan0 -m state --state RELATED,ESTABLISHED -j ACCEPT
sudo iptables -A FORWARD -i wlan0 -o eth0 -j ACCEPT

