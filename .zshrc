# OS 判定
is_mac() { [[ "$(uname)" == "Darwin" ]] }
is_wsl() { [[ -n "$WSL_DISTRO_NAME" ]] }
is_linux() { [[ "$(uname)" == "Linux" ]] && ! is_wsl }

setup_mac() {
	PATH="$PATH:/opt/homebrew/bin"
	PATH="$PATH:/usr/local/go/bin"

	eval "$(mise activate zsh)"
	eval "$(mise exec -- starship init zsh)"

	source $(brew --prefix)/share/zsh-autosuggestions/zsh-autosuggestions.zsh

	export SOPS_AGE_KEY_FILE=~/.local/state/sops/age/key.txt

	export PATH="/opt/homebrew/opt/icu4c@76/bin:$PATH"
	export ICU_CFLAGS="-I$(brew --prefix icu4c)/include"
	export ICU_LIBS="-L$(brew --prefix icu4c)/lib -licui18n -licuuc -licudata"

	export LDFLAGS="-L/usr/local/opt/openssl/lib"
	export CPPFLAGS="-I/usr/local/opt/openssl/include"
	export PATH="/opt/homebrew/opt/postgresql@16/bin:$PATH"
	export PATH="${KREW_ROOT:-$HOME/.krew}/bin:$PATH"
}

setup_wsl() {
	plugins=(
		zsh-autosuggestions
	)

	eval "$(~/.local/bin/mise activate zsh)"
	eval "$(starship init zsh)"

	PATH="$PATH:/usr/local/go/bin"

	source ~/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
	source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh

	alias pbcopy='clip.exe'
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

# fzf history
function fzf-select-history() {
    BUFFER=$(history -n -r 1 | fzf --query "$LBUFFER" --reverse)
    CURSOR=$#BUFFER
    zle reset-prompt
}
zle -N fzf-select-history
bindkey '^r' fzf-select-history
