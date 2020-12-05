#!/usr/bin/env zsh

# https://github.com/unixorn/awesome-zsh-plugins#antibody

# if antibody command is installed.. initialize it
chk::command 'antibody' && source <(antibody init)
