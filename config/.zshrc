###########################################################################
# basic configuration 
###########################################################################
export ZSH=$HOME/.oh-my-zsh         # Path to your oh-my-zsh installation.
export TERM="xterm-256color"        # terminal color setting
export DISPLAY=127.0.0.1:0          # set display port 
export PATH="$PATH:$HOME/.rvm/bin"  # add RVM to PATH for scripting  
export PATH="$HOME/.rbenv/bin:$PATH"
export PATH="$HOME/.rbenv/plugins/ruby-build/bin:$PATH"
export PATH="$HOME/miniconda3/bin:$PATH"
export PATH="$HOME/.local/bin:$PATH"
ZSH_THEME="rkj-repos"
KEYTIMEOUT=1                        # 10ms for key sequences, which reduce the execution time from insert mode to normal mode

###########################################################################
# powerlevel9k setting
###########################################################################
# base setting on prompt line
POWERLEVEL9K_MODE='nerdfont-complete'
POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(host dir dir_writable vcs anaconda)
POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(status background_jobs time)
# anaconda
POWERLEVEL9K_ANACONDA_RIGHT_DELIMITER='>'
POWERLEVEL9K_ANACONDA_LEFT_DELIMITER='<'
POWERLEVEL9K_ANACONDA_BACKGROUND='24'
POWERLEVEL9K_ANACONDA_FOREGROUND='111'

###########################################################################
# plugins 
###########################################################################
plugins=(git zsh-syntax-highlighting zsh-autosuggestions)
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

###########################################################################
# alias 
###########################################################################
alias gdrive="/mnt/d/gdrive"

###########################################################################
# 'man' settings
###########################################################################
export LESS='--ignore-case --status-column --LONG-PROMPT --RAW-CONTROL-CHARS --HILITE-UNREAD --tabs=4 --window=4'
export LESS_TERMCAP_mb=$'\E[1;31m'      # begin bold
export LESS_TERMCAP_md=$'\E[1;36m'      # begin blink
export LESS_TERMCAP_me=$'\E[0m'         # reset bold/blink
export LESS_TERMCAP_so=$'\E[01;44;33m'  # begin reverse video
export LESS_TERMCAP_se=$'\E[0m'          # reset reverse video
export LESS_TERMCAP_us=$'\E[1;32m'      # begin underline
export LESS_TERMCAP_ue=$'\E[0m'         # reset underline
export GROFF_NO_SGR=1                   # for konsole and gnome-terminal

source $ZSH/oh-my-zsh.sh
source $HOME/.zshenv
source ~/.rvm/scripts/rvm
