#!/bin/sh

# install latest vim
sudo add-apt-repository ppa:jonathonf/vim
sudo apt update && sudo apt -y upgrade
sudo apt install -y vim

# install latest git
sudo add-apt-repository ppa:git-core/ppa
sudo apt update
sudo apt install -y git

# install curl
sudo apt update
sudo apt install -y curl

# install nodejs
curl -fsSL https://deb.nodesource.com/setup_18.x | sudo -E bash -
sudo apt-get install -y nodejs

# setup plugin manager & .vimrc file
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
cp ~/vim_setup/.vimrc ~/.vimrc

# install plugin
vim +PluginInstall +qall

# copy coc-config file into .vim
cp ~/vim_setup/coc-settings.json ~/.vim/coc-settings.json

# build/index.js error prompt. Proceed to coc.nvim to install
cd ~/.vim/bundle/coc.nvim
npm install

# install python language server
vim +'CocInstall coc-pyright'
# refer to:
# https://github.com/neoclide/coc.nvim/wiki/Language-servers
# for more language
