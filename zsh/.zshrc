# Path to your oh-my-zsh configuration.
# ZSH=$HOME/repos/zsh/oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.

#ZSH_THEME="robbyrussell"
#export DOTFILES=~/.dotfiles
export ZSHFILES=~/.zsh

source ~/.private/env.zsh
# Set to this to use case-sensitive completion
# CASE_SENSITIVE="true"

# Comment this out to disable bi-weekly auto-update checks
# DISABLE_AUTO_UPDATE="true"

# Uncomment to change how many often would you like to wait before auto-updates occur? (in days)
# export UPDATE_ZSH_DAYS=13

# Uncomment following line if you want to disable colors in ls
# DISABLE_LS_COLORS="true"

# Uncomment following line if you want to disable autosetting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment following line if you want red dots to be displayed while waiting for completion
COMPLETION_WAITING_DOTS="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
#plugins=(git extract) 

#source $ZSH/oh-my-zsh.sh
unsetopt correct_all
setopt correct

export PATH=$PATH:~/usr/bin:~/usr/sbin:~/usr/opt/android-sdk-linux/platform-tools

# source every .zsh file in this rep
# for config_file ($DOTFILES/**/*.zsh) source $config_file
for config_file ($ZSHFILES/**/*.zsh) source $config_file

# Set color support since these terminals suck and dont do it correctly
case $COLORTERM in
    Terminal) TERM=xterm-256color ;;
    gnome-terminal) TERM=xterm-256color ;;
    xfce4-terminal) TERM=xterm-256color ;;
    xfce4-terminal) TERM=xterm-256color ;;
esac
setxkbmap -option ctrl:nocaps
# setxkbmap -option compose:lwin

eval $(keychain --eval --agents ssh,gpg -Q --quiet)
/usr/local/bin/chkboot_user.sh
