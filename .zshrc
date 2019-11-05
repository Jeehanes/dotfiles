export PATH='/home/john.local/share:/home/john/bin:/home/john/python:home/john/bin:/bin:/sbin:/usr/bin:/usr/sbin:/usr/X11R6/bin:/usr/local/bin:/usr/local/sbin:/usr/games:$PATH'
export EDITOR=/usr/local/bin/vim
# Path to your oh-my-zsh installation.
  export ZSH=/home/john/.oh-my-zsh

# Theme to load
ZSH_THEME="clean"
#ZSH_THEME="robbyrussell"

HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to display red dots whilst waiting for completion.
COMPLETION_WAITING_DOTS="true"

# Load plugins (plugins can be found in ~/.oh-my-zsh/plugins/*)
# E.g.: plugins=(rails git textmate ruby lighthouse)
plugins=(
zsh-autosuggestions
)

source $ZSH/oh-my-zsh.sh

#-Aliasses-----------------------------

alias lf='ls -lhaF' #human readable and show dirs, executables
alias dir='ls -ld -- */'
#John's timehardened aliases from bash
alias cl='clear'
alias hop=htop
alias up='cd ..'
alias loud='mixerctl outputs.master=200,200'
alias low='mixerctl outputs.master=100,100'
#Actually Pinguinradio
alias aardschok='mplayer http://178.18.137.245/;stream.nsv/&type=mp3'
alias pinguinworld='mplayer http://178.18.137.245:80/;stream.mp3'
alias bbc4="mplayer http://bbcmedia.ic.llnwd.net/stream/bbcmedia_radio4fm_mf_p"
alias stop='doas shutdown -p now'

# dirs navigation; clever, but I don't use it
# type drs to see list, 1-9 to go to dir
alias drs='dirs -v | head -10'
alias 1='cd -'
alias 2='cd -2'
alias 3='cd -3'
alias 4='cd -4'
alias 5='cd -5'
alias 6='cd -6'
alias 7='cd -7'
alias 8='cd -8'
alias 9='cd -9'

# blank screen after 20 seconds and never blank
alias blank='xset s 20'
alias nob='xset s off'
# check for OpenBSD updates; upgrade OpenBSD
alias checksnap='sh /home/john/scripts/update_check.sh'
alias upgrade='/home/john/scripts/upgradesnap.sh'
alias pyvim='gvim -S ~/.vim/pysession.vim'
alias idle='python3'
alias nv='nvim'
alias ootvim='vim -S /home/john/Documents/Esdal/OOT/Digitest/ootjdesession.vim'
# emacs in the terminal
alias emacst='emacs -nw'
# start suckless st with nice font and tmux
# (see .cwmrc: C-M-s also runs this command.)
alias stf='"/usr/local/bin/st -f 'Liberation Mono:size=14' -e tmux"'
# source some fzf files
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
export FZF_DEFAULTS_OPS='--extended'
source /home/john/.vim/fzf/shell/completion.zsh
source /home/john/.vim/fzf/shell/key-bindings.zsh
source /home/john/.config/aliasrc

# Don't autosuggest, it's never helped me as far as I recall
unsetopt correct_all

export PATH="$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$PATH"
