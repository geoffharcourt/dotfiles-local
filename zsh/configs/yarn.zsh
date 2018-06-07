if command -v yarn > /dev/null; then
  PATH="$PATH:$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin"
fi

export -U PATH
