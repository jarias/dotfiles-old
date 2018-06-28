#!/usr/bin/zsh

BASE16_SHELL=$HOME/.config/base16-shell/
eval "$($BASE16_SHELL/profile_helper.sh)"

nvim -c 'set ft=mail' $1
