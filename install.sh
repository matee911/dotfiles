#!/usr/bin/env bash

#ln -s `pwd`/zsh_nocorrect ~/.zsh_nocorrect
#ln -s `pwd`/zprofile ~/.zprofile
#ln -s `pwd`/zshenv ~/.zshenv
#ln -s `pwd`/zshrc ~/.zshrc

# Git
ln -s `pwd`/gitconfig ~/.gitconfig
ln -s `pwd`/gitignore_global ~/.gitignore_global

# Python
ln -s `pwd`/pip ~/.pip

# PostgreSQL
ln -s `pwd`/psqlrc ~/.plsqrc
# This one should never be linked and committed
cp `pwd`/.pgpass ~/.pgpass

# TextEditors
ln -s `pwd`/.nanorc ~/.nanorc
