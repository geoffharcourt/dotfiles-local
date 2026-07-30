# pnpm
export PNPM_HOME="$HOME/Library/pnpm"

alias pnpm="sfw pnpm"
alias npx="sfw pnx"
alias pnx="sfw pnx"

case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac
