service isc-dhcp-server stop
service hostapd stop
update-rc.d isc-dhcp-server disable
update-rc.d hostapd disable
cp interfaces.normal /etc/network/interfaces
#service networking restart
