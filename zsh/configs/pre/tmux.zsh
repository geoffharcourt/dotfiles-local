_not_inside_tmux() {
  [[ -z "$TMUX" ]]
}

ensure_tmux_is_running() {
  if _not_inside_tmux; then
    tat
  fi
}

if [[ -z "$MYVIMRC" ]]; then
  ensure_tmux_is_running
fi
