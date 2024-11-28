#!/bin/bash
set -eufo pipefail
echo ""
echo "🤚  This script will setup .dotfiles for you."
read -n 1 -r -s -p $'    Press any key to continue or Ctrl+C to abort...\n\n'

xcode-select --install || echo "XCode already installed"

# Install Homebrew if necessary
if which -s brew; then
  echo 'Homebrew is already installed'
else
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

  case "$(uname -s)" in
  Darwin)
      # commands to install password-manager-binary on Darwin
      #
      echo 'eval "$(/opt/homebrew/bin/brew shellenv)"' >> $HOME/.zprofile
      eval "$(/opt/homebrew/bin/brew shellenv)"
      ;;
  Linux)
      # commands to install password-manager-binary on Linux
      echo 'eval "$(/opt/homebrew/bin/brew shellenv)"' >> $HOME/.zprofile
      echo 'eval "$(/opt/homebrew/bin/brew shellenv)"' >> $HOME/.bash_profile
	    eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)";
      ;;
  *)
      echo "unsupported OS"
      exit 1
      ;;
  esac
fi

brew install chezmoi
brew install 1password-cli
chezmoi init --apply dk0d

