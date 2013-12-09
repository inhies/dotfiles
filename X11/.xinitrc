#!/bin/sh
#
# ~/.xinitrc
#
# Executed by startx (run your window manager from here)

setxkbmap -option ctrl:nocaps

[[ -f ~/.Xresources ]] && xrdb -merge ~/.Xresources

if [ -d /etc/X11/xinit/xinitrc.d ]; then
  for f in /etc/X11/xinit/xinitrc.d/*; do
    [ -x "$f" ] && . "$f"
  done
  unset f
fi

xscreensaver -no-splash &

# Disable touchpad
synclient TouchpadOff=1

# Volume control
volti &
skippy-xd --start-daemon &

# Watch the screensaver
xss-watch.sh &

urxvtd -q -f -o 
exec herbstluftwm --locked
