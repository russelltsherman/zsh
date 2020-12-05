#!/usr/bin/env zsh

# create a new alias if it does not already exist
# usage:
#     alias::new 'll' 'ls -l'
alias::new() {
  chk::command "$1" || alias "$1"="$2"
}

alias::new 'll' 'ls -l'
alias::new 'lla' 'ls -al'
