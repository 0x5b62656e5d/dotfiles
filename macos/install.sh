#!/bin/bash

echo "Prompting for sudo password..."
sudo true

# Installis brew
echo "Installing Homebrew..."
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

# Installs git
echo "Installing git..."
brew install git

# Installs zsh
echo "Installing zsh..."
brew install zsh
chsh -s $(which zsh)

# Installs oh-my-zsh
echo "Installing oh-my-zsh..."
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# Installs powerlevel10k theme
echo "Installing powerlevel10k theme..."
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git "${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k"

# Configures zsh and p10k with dotfiles repository
echo "Configuring zsh and powerlevel10k..."
curl -o $HOME/.zshrc https://raw.githubusercontent.com/0x5b62656e5d/dotfiles/main/dots/.zshrc
curl -o $HOME/.p10k.zsh https://raw.githubusercontent.com/0x5b62656e5d/dotfiles/main/dots/.p10k.zsh
curl -o $HOME/.bash_profile https://raw.githubusercontent.com/0x5b62656e5d/dotfiles/main/dots/macos/.bash_profile
curl -o $HOME/.gitconfig https://raw.githubusercontent.com/0x5b62656e5d/dotfiles/main/dots/macos/.gitconfig
curl -o $HOME/.zprofile https://raw.githubusercontent.com/0x5b62656e5d/dotfiles/main/dots/macos/.zprofile
curl -o $HOME/yt-dlp.conf https://raw.githubusercontent.com/0x5b62656e5d/dotfiles/main/dots/macos/yt-dlp.conf

# Installs zsh-autosuggestions
echo "Installing zsh-autosuggestions..."
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions

# Installs zsh-syntax-highlighting
echo "Installing zsh-syntax-highlighting..."
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting

# Installs fastfetch
echo "Installing fastfetch..."
brew install fastfetch

# Installs ripgrep
echo "Installing ripgrep..."
brew install ripgrep

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

# Install docker
echo "Installing Docker..."
#! DMG

# Install fd-find
echo "Installing fd-find..."
brew install fd

# Install bat
echo "Installing bat..."
brew install bat

# Install fzf
echo "Installing fzf..."
brew install fzf

# Install eza
echo "Installing eza..."
brew install eza

# Install zoxide
echo "Installing zoxide..."
brew install zoxide

# Install btop
echo "Installing btop..."
brew install btop

# Install tailscale
#! PKG

# Install neovim
echo "Installing Neovim..."
brew install neovim

# Install miniconda
echo "Installing Miniconda..."
mkdir -p ~/miniconda3
curl https://repo.anaconda.com/miniconda/Miniconda3-latest-MacOSX-arm64.sh -o ~/miniconda3/miniconda.sh
bash ~/miniconda3/miniconda.sh -b -u -p ~/miniconda3
rm ~/miniconda3/miniconda.sh

# Install yt-dlp
echo "Installing yt-dlp..."
brew install yt-dlp

# Install cmatrix
echo "Installing cmatrix..."
brew install cmatrix

# Install sl
echo "Installing sl..."
brew install sl

# Installs gpg
echo "Installing GPG..."
brew install gnupg

# Installs pinentry-mac
echo "Installing pinentry-mac..."
brew install pinentry-mac

# Installs pipes-sh
echo "Installing pipes.sh..."
brew install pipes-sh

# Installs rust
echo "Installing Rust..."
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh

# Installs gh
echo "Installing GitHub CLI..."
brew install gh

echo "Installation complete!"

echo "Configuring GitHub CLI..."
gh auth login