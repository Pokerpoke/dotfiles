#!/usr/bin/env bash
set -e

RED='\033[0;31m'
GREEN='\033[0;32m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color
SCRIPT_DIR=$(dirname $(readlink -f $0))

sudo apt-get update

apps=(
    "chromium-browser"
    "git"
    "zsh"
    "vim"
    "htop"
    "tree"
    "gnome-tweak-tool"
    "cmake"
    "curl"
    "aria2"
    "python-pip"
    "python3-pip"
    "python3-venv"
    "supervisor"
    "uget"
    "shutter"
    )

for name in ${apps[@]}; do
    sudo apt-get install -y ${name}
done

# shadowsocks
sudo pip install shadowsocks

# Install oh-my-zsh
sh -c "$(wget https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh -O -)"
echo -e "${GREEN}Installed oh-my-zsh.${NC}"

# restore vimrc and zshrc
${SCRIPT_DIR}/restore.sh
