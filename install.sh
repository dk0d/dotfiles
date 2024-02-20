#!/bin/bash

set -eufo pipefail

sh -c "$(curl -fsLS get.chezmoi.io)" -- -b "$HOME/.local/bin" init --verbose --apply dk0d --ssh

# echo ""
# echo "🤚  This script will setup .dotfiles for you."
# read -n 1 -r -s -p $'    Press any key to continue or Ctrl+C to abort...\n\n'
#
# # Install Homebrew
# if ! command -v brew >/dev/null; then
# 	echo '🍺  Installing Homebrew';
# 	bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)");
# fi
#
# if [ -f ~/.zshrc ]; then
# 	# Install Oh My Zsh
# 	if [ ! -f ~/.oh-my-zsh/oh-my-zsh.sh ]; then
# 		(echo '💰  Installing oh-my-zsh' && yes | sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)")
# 	fi
# fi
#
# # Install chezmoi
# if ! command -v chezmoi >/dev/null; then
# 	echo '👊  Installing chezmoi'
# 	brew install chezmoi
# fi
#
# if [ -d "$HOME/.local/share/chezmoi/.git" ]; then
# 	echo "🚸  chezmoi already initialized"
# 	echo "    Reinitialize with: 'chezmoi init https://github.com/dk0d/dotfiles.git'"
# else
# 	echo "🚀  Initialize dotfiles with:"
# 	echo "    chezmoi init https://github.com/dk0d/dotfiles.git"
# fi
#
# echo ""
# echo "Done."
