
# Setting PATH for Python 3.12
# The original version is saved in .zprofile.pysave
# Add Rust binaries
export PATH="$HOME/.cargo/bin:$PATH"

# Add standard binaries
export PATH="/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:$PATH"

export PATH="/Library/Frameworks/Python.framework/Versions/3.12/bin:${PATH}"

export PROS_TOOLCHAIN="$HOME/Library/Application Support/Code/User/globalStorage/sigbots.pros/install/pros-toolchain-macos/"

# Git GPG stuff
export GPG_TTY=$(tty)
