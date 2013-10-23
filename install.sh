#!zsh

ln -s `pwd`/zsh_nocorrect ~/.zsh_nocorrect
ln -s `pwd`/zprofile ~/.zprofile
ln -s `pwd`/zshenv ~/.zshenv
ln -s `pwd`/zshrc ~/.zshrc

mkdir -p ~/.pip
ln -s `pwd`/.pip/pip.conf ~/.pip/
