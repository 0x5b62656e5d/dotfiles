#!/bin/bash

set -e

# Install RaspAP
echo "Installing minimal RaspAP with Adblock and TCP-BBR (no VPN/REST/WireGuard)..."
curl -sL https://install.raspap.com | bash -s -- --yes \
  --openvpn 0 \
  --restapi 0 \
  --adblock 1 \
  --wireguard 0 \
  --provider 0 \
  --tcp-bbr 1

# Configure network routing
echo "Enabling IPv4 forwarding..."
sudo bash -c 'echo "net.ipv4.ip_forward=1" > /etc/sysctl.d/90_raspap.conf'
sudo sysctl -p /etc/sysctl.d/90_raspap.conf

echo "Adding NAT (MASQUERADE) rule for wlan0..."
sudo iptables -t nat -A POSTROUTING -o wlan0 -j MASQUERADE

echo "Saving iptables rules to persist across reboots..."
sudo apt-get install -y iptables-persistent
sudo netfilter-persistent save

# Configure network interfaces
sudo iw dev wlan0 interface add uap0 type __ap
sudo ifconfig uap0 up

# Configure network
echo "Configuring network..."
sudo iw reg set TW
sudo tee /etc/default/crda > /dev/null <<EOF
REGDOMAIN=TW
EOF

sudo cp $HOME/dotfiles/dots/proxmarkpizero2w/NetworkManager.conf /etc/NetworkManager/
sudo cp $HOME/dotfiles/dots/proxmarkpizero2w/dnsmasq.conf /etc/
sudo cp $HOME/dotfiles/dots/proxmarkpizero2w/wpa_supplicant.conf /etc/wpa_supplicant/
sudo cp $HOME/dotfiles/dots/proxmarkpizero2w/hostapd.conf /etc/hostapd/
sudo cp $HOME/dotfiles/dots/proxmarkpizero2w/dhcpcd.conf /etc/
sudo cp $HOME/dotfiles/dots/proxmarkpizero2w/uap0-create.service /etc/systemd/system/

# Configure services
echo "Configuring services..."
sudo systemctl enable raspapd hostapd dnsmasq
sudo systemctl enable uap0-create

echo "Setup complete!"
echo "Rebooting system..."
sudo reboot now
