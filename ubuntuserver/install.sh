#!/bin/bash

set -e

echo "Prompting for sudo permissions..."
sudo true

# Initializing
echo "Initializing installation script..."
sudo apt-get update -y
sudo apt-get upgrade -y

# Installs git
echo "Installing git..."
sudo apt install git -y

# Installs zsh
echo "Installing zsh..."
sudo apt install zsh -y

# Installs oh-my-zsh
echo "Installing oh-my-zsh..."
RUNZSH=no sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# Installs powerlevel10k theme
echo "Installing powerlevel10k theme..."
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git "${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k"

# Installs zsh-autosuggestions
echo "Installing zsh-autosuggestions..."
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions

# Installs zsh-syntax-highlighting
echo "Installing zsh-syntax-highlighting..."
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting

# Installs fastfetch
echo "Installing fastfetch..."
sudo add-apt-repository ppa:zhangsongcui3371/fastfetch
sudo apt update
sudo apt install fastfetch

# Installs ripgrep
echo "Installing ripgrep..."
sudo apt install ripgrep -y

# Install fzf
echo "Installing fzf..."
sudo apt install fzf -y

# Install nvim
echo "Installing Neovim..."
sudo apt install neovim -y

# Installs nvm
echo "Installing nvm..."
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.40.3/install.sh | bash

# Installs nodejs
echo "Installing Node.js..."
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
nvm install --lts
nvm use --lts
nvm install -g npm

# Install fd-find
echo "Installing fd-find..."
sudo apt install fd-find -y

# Install eza
echo "Installing eza..."
sudo apt install eza -y

# install bat
echo "Installing bat..."
sudo apt install bat -y
mkdir -p $HOME/.local/bin
ln -s /usr/bin/batcat $HOME/.local/bin/bat

# Install zoxide
echo "Installing zoxide..."
curl -sSfL https://raw.githubusercontent.com/ajeetdsouza/zoxide/main/install.sh | sh

# Install cron and crontab
echo "Installing cron and crontab..."
sudo apt install cron -y
sudo systemctl enable cron
sudo systemctl start cron

# Install btop
echo "Installing btop..."
sudo apt install btop -y

# Install tailscale
echo "Installing Tailscale..."
curl -fsSL https://tailscale.com/install.sh | sh
sudo tailscale up --advertise-exit-node --ssh

# Install ufw
echo "Installing UFW..."
sudo apt install ufw -y
sudo ufw allow 80/tcp
sudo ufw allow 443/tcp
sudo ufw allow 8000/tcp
sudo ufw enable

# Install fail2ban
echo "Installing Fail2Ban..."
sudo apt install fail2ban -y
sudo systemctl enable fail2ban
sudo systemctl start fail2ban

# Install iputils-ping
echo "Installing iputils-ping..."
sudo apt install iputils-ping -y

# Install net-tool
echo "Installing net-tools..."
sudo apt install net-tools -y

# Configuring dotfiles
echo "Configuring dotfiles..."
mkdir -p $HOME/.config/btop
mkdir -p $HOME/.config/fastfetch
rm -rf $HOME/.config/nvim

git clone https://github.com/0x5b62656e5d/dotfiles.git $HOME/dotfiles
cd $HOME/dotfiles
cp $HOME/dotfiles/.zshrc $HOME/.zshrc
cp $HOME/dotfiles/.p10k.zsh $HOME/.p10k.zsh
cp $HOME/dotfiles/.config/btop/btop.conf $HOME/.config/btop/btop.conf
cp $HOME/dotfiles/.config/fastfetch/config.jsonc $HOME/.config/fastfetch/config.jsonc
cp -r $HOME/dotfiles/.config/nvim $HOME/.config/nvim

# Install Coolify
echo "Installing Coolify..."
curl -fsSL https://cdn.coollabs.io/coolify/install.sh | sudo bash

echo "Installation complete!"
echo "Rebooting system..."
sudo reboot now
