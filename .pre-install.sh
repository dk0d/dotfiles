#!/bin/bash

echo '🍺  Installing Homebrew';

/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)";

if [[ -f "/opt/homebrew/bin/brew" ]]; then
	eval "$(/opt/homebrew/bin/brew shellenv)";
	export PATH=/opt/homebrew/bin:/opt/homebrew/sbin:$PATH;
elif [[ -f "/home/linuxbrew/.linuxbrew/bin/brew" ]]; then
	eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)";
	export PATH=/home/linuxbrew/.linuxbrew/bin:/home/linuxbrew/.linuxbrew/sbin:$PATH;
fi

brew install --cask 1password
brew install 1password-cli
