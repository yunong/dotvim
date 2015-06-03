#!/bin/bash
npm install -g eslint
npm install -g jscs
git clone https://github.com/gmarik/vundle.git ~/.vim/bundle/vundle
git clone https://github.com/yunong/dotvim.git ~/dotvim
ln -sf ~/dotvim/.vimrc ~/.vimrc
brew install ctags
