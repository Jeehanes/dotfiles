#! /usr/local/bin/bash

# desktop background overridden by feh
# so disabled
#xsetroot -solid black

# load Xresources file
xrdb -merge $HOME/.Xresources

# Caps_Lock becomes Escape
xmodmap -e "remove Lock = Caps_Lock" && xmodmap -e "keysym Caps_Lock = Escape"
#
#This disables the screensaver
xset s off
#This disables power saving mode of display
xset -dpms
#Ladies and gentlemen: we got 'm

# Turn up the volume for audio

mixerctl outputs.master=200,200

#feh takes the first filename for screen 1
#the second for screen 2
feh --bg-fill /home/john/Pictures/bkgr.png /home/john/Pictures/bkgr04.jpg

#Play music when cwm starts
#mplayer -endpos 5 /home/john/Music/Why.mp3
# no screen blanking, set with xset s 20
#xset -s noblank
#xset -dpms

# Use Unicode set UTF-8 wherever supported
export LC_CTYPE="en_US.UTF-8"
cwm
