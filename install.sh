#!/bin/bash -e

# cSpell:ignore vimrcs

cd "$(dirname "$0")"

cat << EOF > "$HOME/.vimrc"
set runtimepath+=$PWD
source $PWD/vimrcs/basic.vim
source $PWD/vimrcs/filetypes.vim
source $PWD/vimrcs/plugins_config.vim
source $PWD/vimrcs/extended.vim
source $PWD/vimrcs/main.vim
EOF
