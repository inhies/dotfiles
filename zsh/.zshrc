export ZSHFILES=~/.zsh

source ~/.private/env.zsh

unsetopt correct_all
setopt correct

export PATH=$PATH:~/usr/bin:~/usr/sbin:~/usr/opt/android-sdk-linux/platform-tools

# source every .zsh file in ~/.zsh/*
for config_file ($ZSHFILES/**/*.zsh) source $config_file

# Set color support since these terminals suck and dont do it correctly
case $COLORTERM in
    Terminal) TERM=xterm-256color ;;
    gnome-terminal) TERM=xterm-256color ;;
    xfce4-terminal) TERM=xterm-256color ;;
esac

# Start keychain to manage ssh-agent and gpg-agent
eval $(keychain --eval --agents ssh,gpg -Q --quiet)

# Simple command line calculator
? () { echo "$*" | bc -l; }
