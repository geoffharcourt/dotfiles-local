_not_inside_tmux() {
  [[ -z "$TMUX" ]]
}

ensure_tmux_is_running() {
  if _not_inside_tmux; then
    $HOME/.bin/tat
  fi
}

if [[ -z "$MYVIMRC" ]] && command -v tmux >/dev/null; then
  ensure_tmux_is_running
fi
