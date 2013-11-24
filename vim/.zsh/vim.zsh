function :h () { vim +"h $1" +only; }
function :godoc () { vim +"Godoc $1" +only; }

# vi keys jj as escape, ; as :  
bindkey -v
bindkey -M viins 'kj' vi-cmd-mode
bindkey -M  vicmd ';' execute-named-cmd
bindkey '^R' history-incremental-search-backward

vim_ins_mode="%{$fg[cyan]%}[INS]%{$reset_color%}"
vim_cmd_mode="%{$fg[green]%}[CMD]%{$reset_color%}"
vim_mode=$vim_ins_mode

# Set prompt so we know if we are in insert or command mode
function zle-keymap-select {
  vim_mode="${${KEYMAP/vicmd/${vim_cmd_mode}}/(main|viins)/${vim_ins_mode}}"
  zle reset-prompt
}
zle -N zle-keymap-select

function zle-line-finish {
  vim_mode=$vim_ins_mode
}
zle -N zle-line-finish
RPROMPT='${vim_mode}'
