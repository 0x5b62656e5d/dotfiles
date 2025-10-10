#!/bin/bash

set -e

echo "Installing minimal RaspAP (no VPN/AdBlock/REST/WireGuard)..."
curl -sL https://install.raspap.com | bash -s -- --yes \
  --openvpn 0 \
  --restapi 0 \
  --adblock 0 \
  --wireguard 0 \
  --provider 0 \
  --tcp-bbr 0

echo "Enabling IPv4 forwarding..."
sudo bash -c 'echo "net.ipv4.ip_forward=1" > /etc/sysctl.d/90_raspap.conf'
sudo sysctl -p /etc/sysctl.d/90_raspap.conf

echo "Adding NAT (MASQUERADE) rule for wlan0..."
sudo iptables -t nat -A POSTROUTING -o wlan0 -j MASQUERADE

echo "Saving iptables rules to persist across reboots..."
sudo apt-get install -y iptables-persistent
sudo netfilter-persistent save

echo "Enabling RaspAP services..."
sudo systemctl enable raspapd hostapd dnsmasq

echo "Done — rebooting..."
sudo reboot
