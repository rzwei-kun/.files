## ENV
export ZSH=/home/rzwei/.oh-my-zsh
export PATH="/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/usr/bin/core_perl"
export TERM=xterm-termite
export VISUAL=vim
export GTK_IM_MODULE=ibus
export XMODIFIERS=@im=ibus
export QT_IM_MODULE=ibus


## VAR
plugins=(history wd vi-mode git zsh-autosuggestions)
ZSH_TMUX_AUTOSTART=true
ZSH_THEME="ys"
source $ZSH/oh-my-zsh.sh

ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=240'
ZSH_AUTOSUGGEST_BUFFER_MAX_SIZE=20

## START
# eval `dircolors ~/.dir_colors`
eval 'bindkey "^D" kill-word'
bindkey '^ ' autosuggest-accept


## Aliases
alias s='sudo'
alias p='s pacman'
alias pi='s pacman -S'
alias pr='s pacman -R'
alias pa='pacaur -S'
alias y='yaourt'
alias dg='downgrade'
alias wm='s wifi-menu'
alias sw='s netctl stop-all'
alias ch='rm ~/.zsh_history'
alias bat='s tlp bat'
alias ac='s tlp ac'
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
alias mac='s macchanger'
alias il='s ip link set'
alias ia='s ip add add'
alias hn='hugo new'
# alias wine32='WINEARCH=win32 WINEPREFIX=~/.wine32 wine'
# alias winetrick32='WINEARCH=win32 WINEPREFIX=~/.wine32 winetricks'
