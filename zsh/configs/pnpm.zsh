# pnpm
# pnpm itself is installed by mise (config/mise/config.toml). Global JS tools
# are installed with pnpm, listed in ~/.default-pnpm-packages, and installed
# with `mise run pnpm-globals`. pnpm >= 11 puts their bins in $PNPM_HOME/bin,
# which post/path.zsh adds to PATH.
export PNPM_HOME="$HOME/Library/pnpm"

# Run package-manager commands through Socket Firewall (sfw)
alias pnpm="sfw pnpm"
alias npx="sfw pnx"
alias pnx="sfw pnx"
