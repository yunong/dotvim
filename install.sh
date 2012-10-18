#!/bin/bash

pkgin up
pkgin -y install gcc-runtime gcc-compiler gmake scmgit python26 exctags
git clone https://github.com/gmarik/vundle.git ~/.vim/bundle/vundle
git clone git://github.com/yunong/dotvim.git ~/dotvim
ln -sf ~/dotvim/.vimrc ~/.
ln -sf ~/dotvim/.gitconfig ~/.
scp yunong@10.99.99.254:~/.ssh/id_dsa ~/.ssh/id_dsa
