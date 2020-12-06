#!/usr/bin/env zsh

#
# Z Shell Startup File
#

# - `$ZDOTDIR/.zlogin`
#   zlogin should contain commands that should be executed only in login shells.
#   zlogin is not the place for alias definitions, options, environment variable settings, etc.;
#   as a general rule, it should not change the shell environment at all.
#   Rather, it should be used to set the terminal type and run a series of external commands (fortune, msgs, etc).

# if pfetch command is istalled AND ENABLED call it once on login
[ $commands[pfetch] ] && [[ "${PFETCH_ENABLE}" == "true" ]] && pfetch
