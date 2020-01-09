#!/bin/sh
set -e

cd $(dirname $0)

thisdir=$(pwd | sed -E "s-^$HOME($|(/.*))-~\2-")

rm -rf ~/.vim_runtime
git clone https://github.com/amix/vimrc.git ~/.vim_runtime

echo "set runtimepath+=~/.vim_runtime

source ~/.vim_runtime/vimrcs/basic.vim
source ~/.vim_runtime/vimrcs/filetypes.vim
source ~/.vim_runtime/vimrcs/plugins_config.vim
source ~/.vim_runtime/vimrcs/extended.vim
source ${thisdir}/vimrcs/main.vim" > ~/.vimrc
