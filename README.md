Dotfiles
========

This is my personal dotfile repo. They are organized to be easily
used with GNU Stow and git subtree.


Usage
-----

If you want to use some (or all) of my configuration settings, simply
clone the repository, `cd` in to it, and then run `stow <package>` 
where <package> is any of the folders you see in the root of this
repository. 

For instance, running `stow vim` will symlink all my the files in the
vim folder in to your home directory.


Helpers
-------

The `scripts` project contains many helper scripts for working with `stow`,
including `restow` which accepts a lists of project names which will recreate
all the symlinks for the specified project; useful if you've made some changes.


Must-have programs
------------

dunst
hlwm
dmenu-launch
conky
tint2

zsh
grml-zsh-config-git
urxvt
urxvt-perls
xrdb
xsel
grc
htop
zathura
git
vim
stow
go
infinality
redshift
keychain

pidgin
firefox
