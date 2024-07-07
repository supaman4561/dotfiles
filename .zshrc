# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
# if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
#   source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
# fi
#
# source ~/powerlevel10k/powerlevel10k.zsh-theme
#
# # To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
# [[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
source /home/spmn/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh

eval "$(mise activate zsh)"

alias pbcopy='clip.exe'
alias la='ls -a'
alias ll='ls -l'
alias gg='cd $(ghq root)/$(ghq list | fzf --reverse)'
alias k='kubectl'
alias pass='cat /dev/urandom | LC_CTYPE=C tr -dc "[:alnum:]" | fold -w 16 | head -n 1'

PATH="$PATH:/usr/local/go/bin"
eval "$(starship init zsh)"
