#!/bin/bash

# Check if in sudo mode
if [ "$EUID" -ne 0 ]; then
  echo "Please run as root"
  exit
fi

OS=""

if [[ "$OSTYPE" == "linux-gnu"* ]]; then
  OS="Linux"
elif [[ "$OSTYPE" == "darwin"* ]]; then
  OS="macOS"
else
  echo "Unknown operating system"
  exit 1
fi

echo "Operating system: $OS"

# Check if Homebrew is installed, if not install it
if test ! $(which brew); then
  echo "Installing Homebrew..."
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi

if [ "$OS" == "Linux" ]; then
  if [ -x "$(command -v apt)" ]; then
    echo "Using apt package manager"
    sudo apt update
    sudo apt upgrade
    sudo apt install -y git curl wget zsh
    chsh -s $(which zsh)
elif [ "$OS" == "macOS" ]; then
  if [ -x "$(command -v brew)" ]; then
    echo "Using Homebrew package manager"
    brew update
    brew upgrade
  fi
fi

cp ./zsh/* ~/

brew install oh-my-posh antidote
antidote load
exec zsh