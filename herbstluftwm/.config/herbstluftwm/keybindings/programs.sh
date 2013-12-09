hc keybind $Mod-F12 spawn q3terminal.sh
hc keybind $Mod-Shift-q quit
hc keybind $Mod-Control-l spawn xscreensaver-command -lock
hc keybind $Mod-Control-s spawn systemctl suspend

hc keybind $Sup-Shift-s spawn xfce4-screenshooter

hc keybind $Sup-k spawn keepass
hc keybind $Mod-Shift-p spawn keepass --auto-type

hc keybind $Mod-Shift-c close

hc keybind $Mod-Shift-r spawn zsh -tc "xrdb ~/.Xresources &| . ~/.zshrc &| tmux source-file ~/.tmux.conf &| herbstclient reload" 
hc keybind $Sup-p spawn pidgin

hc keybind $Sup-f spawn firefox
hc keybind $Sup-Shift-f spawn firefox -no-remote

hc keybind $Sup-w spawn urxvt -e weechat
hc keybind $Sup-Shift-t spawn thunar
hc keybind $Sup-t spawn urxvtc -e zsh --login
#hc keybind $Mod-t spawn urxvt -e zsh --login -c "tmux -q has-session && CLIENTID=tsesh.`date +%S` && exec tmux new-session -d -t tsesh -s $CLIENTID \; set-option destroy-unattached \; attach-session -t $CLIENTID || CLIENTID=tsesh.`date +%S` && exec tmux new-session -d -s tsesh && tmux new-session -d -t tsesh -s $CLIENTID \; set-option destroy-unattached \; attach-session -t $CLIENTID"

#hc keybind $Mod-t spawn urxvt -e zsh -c "tmux -q has-session && exec tmux attach-session -d || exec tmux new-session -n$USER -s$USER@$HOSTNAME" 
