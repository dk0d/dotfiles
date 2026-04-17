if [ ! -d "$HOME/.config/nvim/venvs/base" ]; then
  cd "$HOME/.config/nvim/venvs"
  uv venv base --python 3.14
  source base/bin/activate
  uv python install --default
fi
