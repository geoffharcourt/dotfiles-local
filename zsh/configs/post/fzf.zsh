# export FZF_CTRL_T_COMMAND='ag -g ""'
# export FZF_DEFAULT_COMMAND='ag -g ""'
export FZF_CTRL_T_COMMAND='rg --files --hidden'
export FZF_DEFAULT_COMMAND='rg --files --hidden'
export FZF_DEFAULT_OPTS=' --bind ctrl-f:page-down,ctrl-b:page-up '

fe() {
  local file
  # file=$(fzf --query="$1" --select-1 --exit-0)
  file=$(ag -g "$1" | fzf-tmux -d 40 --select-1 --exit-0)
  [ -n "$file" ] && ${EDITOR} "$file"
}

bindkey '^p' fe

# This should be rewritten to just use the fzf installed by homebrew
[ -f /usr/local/opt/fzf/shell/key-bindings.zsh ] && source /usr/local/opt/fzf/shell/key-bindings.zsh

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
