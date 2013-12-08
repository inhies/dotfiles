ZSHFILES=~/.zsh
PRIVFILES=~/.private

plugins=(colorize zsh-syntax-highlighting)

unsetopt correct_all
setopt correct

export PATH=$PATH:~/usr/bin:~/usr/sbin:~/usr/opt/android-sdk-linux/platform-tools

# source every .zsh file in ~/.zsh/*/
if [ -d "$ZSHFILES" ]; then
	for config_file ($ZSHFILES/**.zsh); do  
		#		echo $config_file
		source $config_file; 
	done
fi

# Set color support since these terminals suck and dont do it correctly
case $COLORTERM in
	Terminal|gnomer-terminal|xfce4-terminal) 
		TERM=xterm-256color 
		;;
esac

# Start keychain to manage ssh-agent and gpg-agent
eval $(keychain --eval --agents ssh,gpg -Q --quiet)

# Simple command line calculator
? () { echo "$*" | bc -l; }

# Set a 60 second timeout for terminal sessions
if [[ "$TMOUT" == "" ]]; then
	TMOUT=60
	readonly TMOUT
	export TMOUT
fi

# use vlock to lock terminals instead of closing them
TRAPALRM() { : }

# private scripts and such that you don't feel like sharing on github
if [ -d "$PRIVFILES" ]; then
	for private ($PRIVFILES/*.zsh); do source $private; done
fi

