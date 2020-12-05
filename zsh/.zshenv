#!/usr/bin/env zsh

#
# Z Shell Startup File
#

# - `$ZDOTDIR/.zshenv`
#   .zshenv is sourced on all invocations of the shell, unless the -f option is set.
#   It should contain commands to set the command search path, plus other important environment variables.
#   .zshenv should not contain commands that produce output or assume the shell is attached to a tty.

# If ZDOTDIR is not set, then the value of HOME is used; this is the usual case.

# our .zshenv is symlinked to $HOME so that the zshell will load it automatically
# with this var we are telling zshell to look to ${HOME}/.zsh/ for the remaining zshell startup files
export ZDOTDIR="${ZDOTDIR:-"${HOME}/.zsh/"}"
