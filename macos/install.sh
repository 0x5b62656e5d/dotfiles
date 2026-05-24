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

# Installs zsh-completions
echo "Installing zsh-completions..."
brew install zsh-completions

# Installs zsh-autosuggestions
echo "Installing zsh-autosuggestions..."
brew install zsh-autocomplete

# Installs zsh-syntax-highlighting
echo "Installing zsh-syntax-highlighting..."
brew install zsh-syntax-highlighting

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

# Configuring dotfiles
echo "Configuring dotfiles..."
mkdir -p $HOME/.config/btop
mkdir -p $HOME/.config/fastfetch
mkdir -p $HOME/.config/gh-dash
rm -rf $HOME/.config/nvim

git clone https://github.com/0x5b62656e5d/dotfiles.git $HOME/dotfiles
cp $HOME/dotfiles/dots/macos/.zshrc $HOME/.zshrc
cp $HOME/dotfiles/dots/macos/.bash_profile $HOME/.bash_profile
cp $HOME/dotfiles/dots/macos/.gitconfig $HOME/.gitconfig
cp $HOME/dotfiles/dots/macos/.zprofile $HOME/.zprofile
cp $HOME/dotfiles/dots/macos/yt-dlp.conf $HOME/.yt-dlp.conf
cp $HOME/dotfiles/.config/btop/btop.conf $HOME/.config/btop/btop.conf
cp $HOME/dotfiles/.config/fastfetch/config.jsonc $HOME/.config/fastfetch/config.jsonc
cp $HOME/dotfiles/.config/gh-dash/config.yml $HOME/.config/gh-dash/config.yml
cp $HOME/dotfiles/.config/starship.toml $HOME/.config/starship.toml

echo "Installation complete!"

echo "Configuring GitHub CLI..."
gh auth login