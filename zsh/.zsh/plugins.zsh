#!/bin/zsh

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
