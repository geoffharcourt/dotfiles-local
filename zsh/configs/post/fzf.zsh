export FZF_CTRL_T_COMMAND='rg --files --hidden'
export FZF_DEFAULT_COMMAND='rg --files --hidden'
export FZF_DEFAULT_OPTS=' --bind ctrl-f:page-down,ctrl-b:page-up '

[ -f /usr/local/opt/fzf/shell/key-bindings.zsh ] && source /usr/local/opt/fzf/shell/key-bindings.zsh

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
