export FZF_CTRL_T_COMMAND='ag -g ""'
export FZF_DEFAULT_COMMAND='ag -g ""'
export FZF_DEFAULT_OPTS='
  --bind ctrl-f:page-down,ctrl-b:page-up
  --color fg:109,bg:233,hl:187,fg+:110,bg+:234,hl+:181
  --color info:108,prompt:179,spinner:108,pointer:131,marker:168
'

# This should be rewritten to just use the fzf installed by homebrew
[ -f /usr/local/opt/fzf/shell/key-bindings.zsh ] && source /usr/local/opt/fzf/shell/key-bindings.zsh
