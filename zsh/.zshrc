ZSHFILES=~/.zsh
PRIVFILES=~/.private

plugins=(colorize zsh-syntax-highlighting per-directory-history)

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
? () { echo "scale=4;$*" | bc -l; }
alias hc=herbstclient
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

is_plugin() {
	local base_dir=~/.zsh
	local name=$1
	test -f $base_dir/plugins/$name/$name.plugin.zsh
}

for plugin ($plugins); do
	if is_plugin $plugin; then
		source ~/.zsh/plugins/$plugin/$plugin.plugin.zsh
	fi
done
