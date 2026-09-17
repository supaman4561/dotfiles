# OS 判定
is_mac() { [[ "$(uname)" == "Darwin" ]] }
# WSL_DISTRO_NAME は login(1) 経由 (例: wezterm の WSL domain) だと消えるので、カーネル情報でも判定する
is_wsl() { [[ -n "$WSL_DISTRO_NAME" ]] || grep -qi microsoft /proc/sys/kernel/osrelease 2>/dev/null }
is_linux() { [[ "$(uname)" == "Linux" ]] && ! is_wsl }

setup_mac() {
	PATH="$PATH:/opt/homebrew/bin"
	PATH="$PATH:/usr/local/go/bin"

	eval "$(mise activate zsh)"
	eval "$(starship init zsh)"

	source $(brew --prefix)/share/zsh-autosuggestions/zsh-autosuggestions.zsh
	source $(brew --prefix)/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

	export SOPS_AGE_KEY_FILE=~/.local/state/sops/age/key.txt

	export PATH="/opt/homebrew/opt/icu4c@76/bin:$PATH"
	export ICU_CFLAGS="-I$(brew --prefix icu4c)/include"
	export ICU_LIBS="-L$(brew --prefix icu4c)/lib -licui18n -licuuc -licudata"

	export LDFLAGS="-L/usr/local/opt/openssl/lib"
	export CPPFLAGS="-I/usr/local/opt/openssl/include"
	export PATH="/opt/homebrew/opt/postgresql@16/bin:$PATH"
	export PATH="${KREW_ROOT:-$HOME/.krew}/bin:$PATH"

	export ANDROID_HOME=$HOME/Library/Android/sdk
  	export PATH=$PATH:$ANDROID_HOME/platform-tools
  	export PATH=$PATH:$ANDROID_HOME/emulator

}

setup_wsl() {
	plugins=(
		zsh-autosuggestions
	)

	eval "$(~/.local/bin/mise activate zsh)"
	eval "$(~/.local/bin/mise exec -- starship init zsh)"

	PATH="$PATH:/usr/local/go/bin"
	PATH="$PATH:$HOME/bin"
	PATH="$PATH:$HOME/.local/bin"

	source ~/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
	source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh

	alias pbcopy='clip.exe'
	export BROWSER=browser
}

setup_linux() {

}

is_mac && setup_mac
is_wsl && setup_wsl
is_linux && setup_linux


##################
# common settings
##################

# alias
alias la='ls -a'
alias ll='ls -l'
alias gg='cd $(ghq root)/$(ghq list | fzf --reverse)'
alias pass='cat /dev/urandom | LC_CTYPE=C tr -dc "[:alnum:]" | fold -w 16 | head -n 1'
alias gpass='cat /dev/urandom | LC_CTYPE=C tr -dc "[:graph:]" | fold -w 16 | head -n 1'

# kubernetes
alias k='kubectl'
alias kx='kubectx'
alias kn='kubens'

# terraform
alias t='terraform'

# fzf history
function fzf-select-history() {
    BUFFER=$(history -n -r 1 | fzf --query "$LBUFFER" --reverse)
    CURSOR=$#BUFFER
    zle reset-prompt
}
zle -N fzf-select-history
bindkey '^r' fzf-select-history

export PATH="${KREW_ROOT:-$HOME/.krew}/bin:$PATH"

. "$HOME/.cargo/env"

export NO_PROXY="localhost,127.0.0.1,::1"
export no_proxy="localhost,127.0.0.1,::1"

# Android SDK
export ANDROID_HOME=/usr/lib/android-sdk
export ANDROID_SDK_ROOT=/usr/lib/android-sdk
export PATH="$PATH:$ANDROID_HOME/platform-tools:$ANDROID_HOME/tools/bin"

# tmux 自動 attach (無効化)
# if [[ -o interactive && -z "$TMUX" && -z "$VSCODE_INJECTION" ]]; then
# 	tmux attach 2>/dev/null || tmux
# fi
