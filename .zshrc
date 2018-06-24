## ENV
export ZSH=$HOME/.oh-my-zsh
# export YARN=/home/rzwei/.yarn/bin
# export GEM_HOME=$HOME/.gem
# export GEM_BIN=$GEM_HOME/ruby/2.5.0/bin
export NPM_PACKAGES="${HOME}/.npm-packages"
# export PATH="/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/usr/bin/core_perl:$YARN:$GEM_BIN:$NPM_PACKAGES/bin"
export PATH="/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/usr/bin/core_perl:$NPM_PACKAGES/bin"
export TERM=xterm-termite
export VISUAL=vim
export GTK_IM_MODULE=ibus
export XMODIFIERS=@im=ibus
export QT_IM_MODULE=ibus

# export WORKON_HOME=$HOME/.virtualenvs
# export VIRTUALENVWRAPPER_SCRIPT=/usr/bin/virtualenvwrapper.sh
# source /usr/bin/virtualenvwrapper_lazy.sh


## VAR
#plugins=(history systemd vi-mode git zsh-autosuggestions)
plugins=(systemd vi-mode zsh-autosuggestions wd)
# ZSH_TMUX_AUTOSTART=true
ZSH_THEME="ys"
source $ZSH/oh-my-zsh.sh

ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=240'
ZSH_AUTOSUGGEST_BUFFER_MAX_SIZE=20

## START
eval 'bindkey "^D" kill-word'
bindkey '^ ' autosuggest-accept

# if [ -n "$VIRTUAL_ENV" ]; then
#   . "$VIRTUAL_ENV/bin/activate"
# fi


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
# alias v='vim'
alias v='nvim'
# alias sv='s vim'
alias sv='s nvim'
alias pingg='ping 9.9.9.9 -s 0'
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
alias ns='netctl start'
# alias wine32='WINEARCH=win32 WINEPREFIX=~/.wine32 wine'
# alias winetrick32='WINEARCH=win32 WINEPREFIX=~/.wine32 winetricks'

###-tns-completion-start-###
if [ -f /home/rzwei/.tnsrc ]; then 
    source /home/rzwei/.tnsrc 
fi
###-tns-completion-end-###
