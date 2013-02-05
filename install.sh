#!/bin/bash

pkgin -f -y up
pkgin -y install gcc-runtime gcc-compiler gmake scmgit python26 exctags gsharutils gcc47 vim-7.3.712 cmake-2.8.10nb1 ruby193-base
git clone https://github.com/gmarik/vundle.git ~/.vim/bundle/vundle
git clone git://github.com/yunong/dotvim.git ~/dotvim
ln -sf ~/dotvim/.vimrc ~/.
ln -sf ~/dotvim/.gitconfig ~/.
scp yunong@10.99.99.254:~/.ssh/id_dsa ~/.ssh/id_dsa
