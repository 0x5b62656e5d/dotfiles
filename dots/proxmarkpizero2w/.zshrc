eval "$(starship init zsh)"

setopt AUTO_CD
setopt correct

export LS_COLORS="rs=0:no=00:mi=00:mh=00:ln=01;36:or=01;31:di=01;34:ow=04;01;34:st=34:tw=04;34:pi=01;33:so=01;33:do=01;33:bd=01;33:cd=01;33:su=01;35:sg=01;35:ca=01;35:ex=01;32:"

# unalias ls
alias ls='eza --color=always --long --all --git --git-repos --modified --icons=always --no-user --no-permissions --tree --ignore-glob="build|node_modules" --level=1'

#* Make vi into nvim (lazyvim)
# unalias vi
alias vi=nvim

#* zoxide
eval "$(zoxide init zsh)"
alias cd="z"

#* batcat/bat
alias bat="batcat"

#* Restarting shell
alias rezsh="source ~/.zshrc && clear"

#* nodejs
alias js=node

#* SSH alias
alias pepperserver="ssh pepper@100.92.19.12"
alias pepperpi="ssh pepper@100.77.239.107"

#* Mitmproxy proxy settings

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

alias flushdns="sudo resolvectl flush-caches"

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

autoload -Uz compinit
compinit

zstyle ':completion:*' menu select
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}
zstyle ':completion:*' group-name ''
zstyle ':completion:*:descriptions' format '%F{yellow}-- %d --%f'

source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh
source ~/.zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
