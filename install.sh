#!/bin/bash
echo 'export GIT_SSL_NO_VERIFY=1' >> ~/.bashrc
source ~/.bashrc
pkgin -f -y up
pkgin -y install gcc-runtime gcc-compiler gmake scmgit python26 exctags gsharutils gcc47 vim-7.3.712
git clone https://github.com/gmarik/vundle.git ~/.vim/bundle/vundle
git clone git://github.com/yunong/dotvim.git ~/dotvim
ln -sf ~/dotvim/.vimrc.smartos ~/.vimrc
ln -sf ~/dotvim/.gitconfig ~/.
scp yunong@10.99.99.254:~/.ssh/id_dsa ~/.ssh/id_dsa

# setup pbcopy
cat << HERE
        cat > /tmp/pbcopy
        scp /tmp/pbcopy yunong@10.99.99.254:/tmp/pbcopy > /dev/null
        ssh -n yunong@10.99.99.254 "cat /tmp/pbcopy | pbcopy && rm /tmp/pbcopy" > /dev/null
        rm /tmp/pbcopy
HERE
> ~/pbcopy
chmod 755 ~/pbcopy

cat << HERE
        ssh -n yunong@10.99.99.254 "pbpaste > /tmp/pbpaste" > /dev/null
        scp yunong@10.99.99.254:/tmp/pbpaste /tmp/pbpaste > /dev/null
        ssh -n yunong@10.99.99.254 "rm /tmp/pbpaste" > /dev/null
        cat /tmp/pbpaste && rm /tmp/pbpaste
HERE
> ~/pbpaste
chmod 755 ~/pbpaste

echo 'PATH=$PATH:~/' >> ~/.bashrc
