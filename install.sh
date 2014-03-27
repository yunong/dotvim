#!/bin/bash
#!/bin/bash
echo 'export GIT_SSL_NO_VERIFY=1' >> ~/.bashrc
echo 'export LANG=en_US.UTF-8' >> ~/.bashrc
source ~/.bashrc
pkgin -f -y up
pkgin -y install gcc-runtime gcc-compiler gmake scmgit python26 exctags gsharutils gcc47 vim-7.3.712 nodejs-0.8.22 zsh
npm install -g jshint
git clone https://github.com/gmarik/vundle.git ~/.vim/bundle/vundle
git clone git://github.com/yunong/dotvim.git ~/dotvim
ln -sf ~/dotvim/.vimrc.smartos ~/.vimrc
ln -sf ~/dotvim/.gitconfig ~/.
scp yunong@10.99.99.254:~/.ssh/id_rsa ~/.ssh/id_rsa
curl -L http://install.ohmyz.sh | sh

# setup pbcopy
cat > ~/pbcopy << HERE
#!/bin/bash
cat > /tmp/pbcopy
scp /tmp/pbcopy yunong@10.99.99.254:/tmp/pbcopy > /dev/null
ssh -n yunong@10.99.99.254 "cat /tmp/pbcopy | pbcopy && rm /tmp/pbcopy" > /dev/null
rm /tmp/pbcopy
HERE
chmod 755 ~/pbcopy

cat > ~/pbpaste << HERE
#!/bin/bash
ssh -n yunong@10.99.99.254 "pbpaste > /tmp/pbpaste" > /dev/null
scp yunong@10.99.99.254:/tmp/pbpaste /tmp/pbpaste > /dev/null
ssh -n yunong@10.99.99.254 "rm /tmp/pbpaste" > /dev/null
cat /tmp/pbpaste && rm /tmp/pbpaste
HERE
chmod 755 ~/pbpaste

echo 'PATH=$PATH:~/' >> ~/.bashrc
