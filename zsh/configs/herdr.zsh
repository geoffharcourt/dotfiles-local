_not_inside_herdr() {
  [[ -z "$HERDR_ENV" ]]
}

ensure_herdr_is_running() {
  if _not_inside_herdr; then
    herdr
  fi
}
