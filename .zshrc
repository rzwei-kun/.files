## ENV
export ZSH=/home/rzwei/.oh-my-zsh
export PATH="/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/usr/bin/core_perl"
export TERM=xterm-termite
export VISUAL=vim
export GTK_IM_MODULE=ibus
export XMODIFIERS=@im=ibus
export QT_IM_MODULE=ibus


## VAR
plugins=(history wd vi-mode )
ZSH_TMUX_AUTOSTART=true
ZSH_THEME="ys"
source $ZSH/oh-my-zsh.sh


## START
# eval `dircolors ~/.dir_colors`
eval 'bindkey "^D" kill-word'


## Aliases
alias s='sudo'
alias p='s pacman'
alias pi='s pacman -S'
alias pr='s pacman -R'
alias y='yaourt'
alias dg='downgrade'
alias wm='s wifi-menu'
alias sw='s netctl stop-all'
alias ch='rm ~/.zsh_history'
alias bat='s tlp bat'
alias v='vim'
alias sv='s vim'
alias pingg='ping 8.8.8.8 -s 0'
alias t='tmux'
alias ta='t attach'
alias tk='t killw'
alias usmount='s mount -o uid=rzwei,gid=wheel'
alias umount='s umount'
alias netctl='s netctl'
alias sctl='s systemctl'
