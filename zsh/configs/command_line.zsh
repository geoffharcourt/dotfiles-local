# source /usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# C-x C-e to edit command-line in EDITOR
autoload -U edit-command-line
zle -N edit-command-line
bindkey '\C-x\C-e' edit-command-line
