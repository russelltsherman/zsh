#!/usr/bin/env zsh

# https://github.com/russelltsherman/base16-shell
[ $commands[antibody] ] && antibody bundle russelltsherman/base16-shell branch:main

# base16 color themes http://chriskempson.com/projects/base16/ are loaded as a zsh plugin
# set color theme for your shell by specifying which color theme script to use here
[ -s $BASE16_SHELL ] && source "$BASE16_SHELL/scripts/base16-gruvbox-dark-medium.sh"
