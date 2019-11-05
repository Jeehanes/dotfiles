# ~/.bashrc: executed by bash(1) for non-login shells.

# If not running interactively, don't do anything
[ -z "$PS1" ] && return

#copied from .cshrc
export PATH='/home/john/bin:/bin:/sbin:/usr/bin:/usr/sbin:/usr/X11R6/bin:/usr/local/bin:/usr/local/sbin:/usr/games:$PATH'
# don't put duplicate lines in the history. See bash(1) for more options
# don't overwrite GNU Midnight Commander's setting of `ignorespace'.
export HISTCONTROL=$HISTCONTROL${HISTCONTROL+,}ignoredups
# ... or force ignoredups and ignorespace
export HISTCONTROL=ignoreboth

#needed to color stuff in latest bash
export CLICOLOR=yes

#append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set a fancy prompt (non-color, unless we know we "want" color)
#case "$TERM" in
 #   xterm-color) color_prompt=yes;;
#esac

#colored prompt
#PS1="\[\033[1;30m\][\[\033[1;37m\]\u\[\033[0;37m\]@\[\033[1;34m\]\h\[\033[1;30m\]] \[\033[0;35m\]\w \[\033[1;34m\][\033\]\A\[\033[1;34m] [\033\]\$\[\033[0;35m\] "
PS1="[\u@\s][\A]\w \$ "
#PS1="[\u@\h] [\A] \w $ "

# some more ls aliases
alias ll='ls -lha' #everything in human readable form
alias lf='ls -lhaF' #human readable and show dirs, executables
alias la='ls -A'
alias l='ls -CF'

# aliases for this user (John)
alias cl='clear'
alias hop=htop
alias sobash='source /home/john/.bashrc'
alias up='cd ..'
alias loud='mixerctl outputs.master=200,200'
alias low='mixerctl outputs.master=100,100'
alias aardschok='mplayer http://178.18.137.245/;stream.nsv/&type=mp3'
alias bbc4="mplayer http://bbcmedia.ic.llnwd.net/stream/bbcmedia_radio4fm_mf_p"
alias dali='xdaliclock -noseconds -nocycle -24 -transparent -geometry 370x143-9-9'
alias nocaps='xmodmap -e "remove Lock = Caps_Lock" && xmodmap -e "keysym Caps_Lock = Escape"'
# Point to my upgrade scripts
alias checksnap='sh /home/john/scripts/update_check.sh'
alias upgrade='/home/john/scripts/upgradesnap.sh'
# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
fi

#if [ "$PS1" ]; then
#    # Disables CapsLock
#    # Looking for a way to imitate the Win key, now it shifts
#    xmodmap -e "remove lock = Caps_Lock"
#    xmodmap -e "add shift = Caps_Lock"
#fi

# filter history with first entered characters
# only possible in bash
bind '"\e[A"':history-search-backward
bind '"\e[B"':history-search-forward

[ -f ~/.fzf.bash ] && source ~/.fzf.bash
