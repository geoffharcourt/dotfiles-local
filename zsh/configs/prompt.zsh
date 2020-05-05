# pure
function zle-line-init zle-keymap-select {
  PROMPT=`~/.bin/purs prompt -k "$KEYMAP" -r "$?" --venv "${${VIRTUAL_ENV:t}%-*}"`
  zle reset-prompt
}
zle -N zle-line-init
zle -N zle-keymap-select

autoload -Uz add-zsh-hook

function _prompt_purs_precmd() {
  ~/.bin/purs precmd
}
add-zsh-hook precmd _prompt_purs_precmd
