export FZF_CTRL_T_COMMAND='ag -g ""'
export FZF_DEFAULT_COMMAND='ag -g ""'
export FZF_DEFAULT_OPTS=' --bind ctrl-f:page-down,ctrl-b:page-up '

# This should be rewritten to just use the fzf installed by homebrew
[ -f /usr/local/opt/fzf/shell/key-bindings.zsh ] && source /usr/local/opt/fzf/shell/key-bindings.zsh

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
