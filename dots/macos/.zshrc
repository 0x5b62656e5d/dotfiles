eval "$(starship init zsh)"

setopt AUTO_CD
setopt correct

export LS_COLORS="rs=0:no=00:mi=00:mh=00:ln=01;36:or=01;31:di=01;34:ow=04;01;34:st=34:tw=04;34:pi=01;33:so=01;33:do=01;33:bd=01;33:cd=01;33:su=01;35:sg=01;35:ca=01;35:ex=01;32:"

#* Set up fzf key bindings and fuzzy completion
source <(fzf --zsh)

export FZF_DEFAULT_OPTS=$FZF_DEFAULT_OPTS'
  --color=border:#bfbfbf,spinner:#ff5eec,marker:#87ff00
  --scrollbar="|"
  --separator="─"
  --border="rounded"
  --padding="1"
  --height 80%
'

# -- Use fd instead of fzf --
export FZF_DEFAULT_COMMAND="fd --type=f --hidden --strip-cwd-prefix --exclude .git"
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
export FZF_ALT_C_COMMAND="fd --type=d --hidden --strip-cwd-prefix --exclude .git"

# Use fd (https://github.com/sharkdp/fd) for listing path candidates.
# - The first argument to the function ($1) is the base path to start traversal
# - See the source code (completion.{bash,zsh}) for the details.
_fzf_compgen_path() {
  fd --hidden --exclude .git . "$1"
}

# Use fd to generate the list for directory completion
_fzf_compgen_dir() {
  fd --type=d --hidden --exclude .git . "$1"
}

#* eza & bat previews
export FZF_CTRL_T_OPTS="--preview 'bat -n --color=always --line-range :500 {}'"
export FZF_ALT_C_OPTS="--preview 'eza --tree --color=always {} | head -200'"

# Advanced customization of fzf options via _fzf_comprun function
# - The first argument to the function is the name of the command.
# - You should make sure to pass the rest of the arguments to fzf.
_fzf_comprun() {
  local command=$1
  shift

  case "$command" in
    cd)           fzf --preview 'eza --tree --color=always {} | head -200' "$@" ;;
    export|unset) fzf --preview "eval 'echo $'{}"         "$@" ;;
    ssh)          fzf --preview 'dig {}'                   "$@" ;;
    *)            fzf --preview "bat -n --color=always --line-range :500 {}" "$@" ;;
  esac
}

# unalias ls
alias ls='eza --color=always --long --all --git --git-repos --modified --icons=always --no-user --no-permissions --tree --ignore-glob="build|node_modules" --level=1'

#* Disabling/enabling
# function sleep() {
#   if [ -z "$1" ]; then
#     echo "Usage: sleep [on] | [off]"
#     return 1
#   fi

#   if [ "$1" = "on" ]; then
#     sudo pmset -a disablesleep 0
#     echo "Sleep enabled"
#   elif [ "$1" = "off" ]; then
#     sudo pmset -a disablesleep 1
#     echo "Sleep disabled"
#   else
#     echo "Usage: sleep [on] | [off]"
#     return 1
#   fi
# }

# autoload -Uz sleep

#* Make vi into nvim (lazyvim)
# unalias vi
alias vi=nvim

#* zoxide
eval "$(zoxide init zsh)"
alias cd="z"

#* Restarting shell
alias rezsh="source ~/.zshrc && clear"

#* Time machine backup
function TM() {
  if [[ $1 == "--start" ]]; then
    tmutil startbackup
  elif [[ $1 == "--stat" ]]; then
    tmutil status
  elif [[ $1 == "--stop" ]]; then
    tmutil stopbackup
  else
    echo "Invalid option. Usage: TM [--start] [--stat] [--stop]"
  fi
}

autoload -Uz TM

#* nodejs
alias js=node

#* SSH alias
alias pepperserver="ssh pepper@100.92.19.12"
alias pepperpi="ssh pepper@100.77.239.107"

#* Mitmproxy proxy settings

#* Mitmproxy start local proxy
function mitmlocal() {
  networksetup -setwebproxy wi-fi 127.0.0.1 8080 off
  networksetup -setsecurewebproxy wi-fi 127.0.0.1 8080 off
  mitmweb
}

#* Reset proxy settings
function resetproxy() {
  networksetup -setwebproxystate wi-fi off
  networksetup -setsecurewebproxystate wi-fi off
}

#* Rust
alias cc="cargo check"
alias cb="cargo build"
alias cbr="cargo build --release"
alias cr="cargo run"
alias ct="cargo test"
alias cf="cargo fmt"
alias cclippy="cargo clippy -- -D warnings"

#* Git
alias gpd="git pull"
alias gpu="git push"
alias ga="git add"
alias gaa="git add ."
alias gcm="git commit -m"
alias gsb="git switch -b"
alias gs="git switch"
alias gsm="git switch --merge"
alias gr="git restore"
alias grs="git restore --staged"
alias grim="git rebase -i main"
alias gst="git stash push -u -m \"WIP\""
alias gsp="git stash pop"
alias glog="git log --graph --pretty='%Cred%h%Creset -%C(auto)%d%Creset %s %Cgreen(%ar) %C(bold blue)<%an>%Creset' --stat --show-signature"
alias gd="git diff"
alias gfp="git fetch -p"
alias gcf="git clean -f"
alias gpuhead="git push -u origin HEAD"

function gtp() {
  if [ -z "$1" ]; then
    echo "Usage: gtp <version>"
    return 1
  fi

  TAG=$1
  [[ $TAG != v* ]] && TAG="v$TAG"
  git tag -a "$TAG" -m "$TAG" && git push origin "$TAG"
}

alias ghd="gh dash"

function ztime() {
  python3 - << 'EOF'
from datetime import datetime, timezone
print(datetime.now(timezone.utc).isoformat(timespec="milliseconds").replace("+00:00", "Z"))
EOF
}

function rdns() {
  if [ -z "$1" ]; then
    echo "Usage: railway-dns <DOMAIN>"
    return 1
  fi

  echo "Getting CNAME records..."
  nslookup -type=CNAME $1
  echo "\nGetting TXT records..."
  nslookup -type=TXT _railway-verify.$1
  return 0
}

#* Go
alias gor="go run ."
alias gob="go build ."
alias got="go test ."
alias goc="go clean"
alias gov="go vet ."
alias gog="go get ."

#* CMake
alias cBb="cmake -B build -DCMAKE_EXPORT_COMPILE_COMMANDS=ON"
alias cbb="cmake --build build"
alias cbbc="cmake --build build --clean-first"

#* Better-auth secret
alias basecret="pnpm dlx @better-auth/cli secret"

function dns() {
  if [[ $1 == "--CF" ]]; then
    networksetup -setdnsservers Wi-Fi 1.1.1.1
  elif [[ $1 == "--None" ]]; then
    networksetup -setdnsservers Wi-Fi Empty
  elif [[ $1 == "--Stat" ]]; then
    networksetup -getdnsservers Wi-Fi
  elif [[ $1 == "--flush" ]]; then
    sudo dscacheutil -flushcache; sudo killall -HUP mDNSResponder
  else
    echo "Invalid option. Usage: dns [--CF] [--Stat] [--None] [--flush]"
  fi
}

#* Kill pm3 instances
function killpm3() {
  sudo kill -9 $(sudo lsof /dev/tty.usbmodemiceman1 | awk 'NR>1 {print $2}');
}

autoload -Uz killpm3

#* Clang/G++
export PATH="/opt/homebrew/opt/llvm/bin:$PATH"
export LDFLAGS="-L/opt/homebrew/opt/llvm/lib"
export CPPFLAGS="-I/opt/homebrew/opt/llvm/include"
export CMAKE_PREFIX_PATH="/opt/homebrew/opt/llvm"

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

export GPG_TTY=$(tty)

# Rust initialization
. "$HOME/.cargo/env"

# pnpm
export PNPM_HOME="/Users/benjamink/Library/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac
# pnpm end

export PATH="/opt/homebrew/sbin:$PATH"
export PATH="/Library/TeX/texbin:$PATH"

if type brew &>/dev/null; then
  fpath=(
    /Users/benjamink/.docker/completions
    $(brew --prefix)/share/zsh-completions
    $fpath
  )
else
  fpath=(/Users/benjamink/.docker/completions $fpath)
fi

autoload -Uz compinit
compinit

zstyle ':completion:*' menu select
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}
zstyle ':completion:*' group-name ''
zstyle ':completion:*:descriptions' format '%F{yellow}-- %d --%f'

source $(brew --prefix)/share/zsh-autosuggestions/zsh-autosuggestions.zsh
source $(brew --prefix)/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
