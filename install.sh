#!/bin/bash

pkgin up
pkgin -y install gcc-runtime gmake scmgit python26 exctags
git clone https://github.com/gmarik/vundle.git ~/.vim/bundle/vundle
git clone git://github.com/yunong/dotvim.git ~/dotvim
ln -sf ~/dotvim/.vimrc
