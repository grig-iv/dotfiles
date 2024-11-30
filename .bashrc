# .bashrc

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
alias vi='nvim'
alias stw='stow --dotfiles --no-folding -t $HOME -d $HOME/.config -S dotfiles'

PS1='\W > '
