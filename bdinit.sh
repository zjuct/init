#!/bin/bash

# 设置代理
export ALL_PROXY=http://sys-proxy-rd-relay.byted.org:8118

# 下载zsh
apt update && apt install zsh
apt install curl

# install ohmyz
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions

sed -i.bak 's/plugins=(git)/plugins=(git zsh-autosuggestions)/' "~/.zshrc"