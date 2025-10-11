#!/bin/bash

set -e

# Install RaspAP
echo "Installing minimal RaspAP (no VPN/AdBlock/REST/WireGuard)..."
curl -sL https://install.raspap.com | bash -s -- --yes \
  --openvpn 0 \
  --restapi 0 \
  --adblock 0 \
  --wireguard 0 \
  --provider 0 \
  --tcp-bbr 0

# Configure network routing
echo "Enabling IPv4 forwarding..."
sudo bash -c 'echo "net.ipv4.ip_forward=1" > /etc/sysctl.d/90_raspap.conf'
sudo sysctl -p /etc/sysctl.d/90_raspap.conf

echo "Adding NAT (MASQUERADE) rule for wlan0..."
sudo iptables -t nat -A POSTROUTING -o wlan0 -j MASQUERADE

echo "Saving iptables rules to persist across reboots..."
sudo apt-get install -y iptables-persistent
sudo netfilter-persistent save

# Set WiFi regulatory domain
echo "Setting regulatory domain..."
if [ ! -f /etc/wpa_supplicant/wpa_supplicant.conf ]; then
  sudo tee /etc/wpa_supplicant/wpa_supplicant.conf > /dev/null <<EOF
ctrl_interface=DIR=/var/run/wpa_supplicant GROUP=netdev
update_config=1
country=TW
EOF
else
  sudo sed -i '/^country=/d' /etc/wpa_supplicant/wpa_supplicant.conf
  sudo sed -i '/^ctrl_interface/ a country=TW' /etc/wpa_supplicant/wpa_supplicant.conf
fi

sudo tee /etc/default/crda > /dev/null <<EOF
REGDOMAIN=TW
EOF

# Configure hostapd
echo "Configuring hostapd..."
sudo cp $HOME/dotfiles/dots/proxmarkpizero2w/hostapd.conf /etc/hostapd/

# Configure network services
echo "Disabling NetworkManager and wpa_supplicant..."
sudo systemctl disable NetworkManager
sudo systemctl disable wpa_supplicant

echo "Enabling RaspAP services..."
sudo systemctl enable raspapd hostapd dnsmasq

echo "Setup complete!"
echo "Rebooting system..."
sudo reboot
