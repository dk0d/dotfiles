#!/bin/bash
set -eufo pipefail
echo ""
echo "🤚  This script will setup .dotfiles for you."
read -n 1 -r -s -p $'    Press any key to continue or Ctrl+C to abort...\n\n'

read -p "Install 1password & 1password-cli? (y/n): " ONE_PASS

UNAME="$(uname -s)"

if [[ $UNAME == "Darwin" ]]; then
  softwareupdate -ia
  xcode-select --install || echo "XCode already installed"
fi


# Install Homebrew if necessary
if [[ -d /opt/homebrew/bin ]]; then
  echo 'Homebrew is already installed'
else if [[ -d /home/linuxbrew/.linuxbrew/bin ]]; then
  echo 'Homebrew is already installed'
else
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

  case "$UNAME" in
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
if [[ $ONE_PASS == [yY] || $ONE_PASS == [yY][eE][sS] ]]; then
  if [[ "$UNAME" == "Darwin" ]]; then
    brew instal --cask 1password
  fi
  brew install 1password-cli
fi
chezmoi init --apply dk0d

