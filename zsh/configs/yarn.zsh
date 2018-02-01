# load ASDF, falling back to rbenv if not available
if command -v yarn > /dev/null; then
  PATH="$PATH:`yarn global bin`"
fi

export -U PATH
