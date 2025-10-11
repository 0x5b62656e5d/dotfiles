#!/bin/bash

set -e

usage() {
  echo "Usage: $0 [-i] [-c]"
  echo "  -i  Install dependencies and add user permission only"
  echo "  -c  Check user permission and compile proxmark3"
  exit 1
}

# Flags
install_only=0
compile_only=0

while getopts ":ic" opt; do
  case $opt in
    i) install_only=1 ;;
    c) compile_only=1 ;;
    *) usage ;;
  esac
done

# If no flags provided
if [ $install_only -eq 0 ] && [ $compile_only -eq 0 ]; then
  usage
fi

echo "Prompting for sudo permissions..."
sudo true


if [ $install_only -eq 1 ]; then
  # Initializing
  echo "Initializing installation script..."
  sudo apt-get update
  sudo apt-get upgrade -y
  sudo apt-get auto-remove -y
  
  # Installs requirements
  echo "Installing required packages..."
  sudo apt-get install --no-install-recommends git ca-certificates build-essential pkg-config \
  libreadline-dev gcc-arm-none-eabi libnewlib-dev qtbase5-dev \
  libbz2-dev liblz4-dev libbluetooth-dev libpython3-dev libssl-dev libgd-dev
  
  # Clones Proxmark 3 Iceman
  echo "Cloning Proxmark 3 Iceman repository..."
  git clone https://github.com/RfidResearchGroup/proxmark3.git
  
  # Remove ModemManager
  echo "Removing ModemManager..."
  sudo systemctl disable ModemManager.service
  sudo systemctl stop ModemManager.service
  sudo apt remove --purge modemmanager
  sudo apt autoremove --purge
  
  # Check connections
  echo "Checking connected USB devices..."
  sleep 2
  if ! sudo dmesg | grep -iq 'cdc_acm.*ttyACM'; then
    echo "ERROR: Proxmark3 USB device not detected. Exiting."
    exit 1
  fi
  
  if ! ls /dev/ttyACM* &>/dev/null; then
    echo "ERROR: /dev/ttyACM* device not found. Exiting."
    exit 1
  fi
  
  echo "Proxmark3 device detected. Continuing..."
  
  # Configuring user permisisons
  echo "Adding user to dialout group for serial access..."
  USER=$(whoami)
  sudo adduser $USER dialout || true
  
  echo "You may need to logout and log back in or reboot for the changes to take effect."
fi

if [ $compile_only -eq 1 ]; then
  echo "Checking user permissions and compiling Proxmark3..."
  
  if [ ! -r /dev/ttyACM0 ] || [ ! -w /dev/ttyACM0 ]; then
    echo "ERROR: No read/write permission on /dev/ttyACM0. Please logout/reboot."
    exit 1
  fi

  cd proxmark3 || { echo "Proxmark3 repo not found!"; exit 1; }

  git pull

  echo "Compiling Proxmark3..."
  make clean && make -j
  sudo make install

  echo "Compilation finished."
fi
