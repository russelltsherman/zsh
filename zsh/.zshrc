#!/usr/bin/env zsh

#
# Z Shell Startup File
#

# - `$ZDOTDIR/.zshrc`
#   .zshrc is sourced in interactive shells.
#   It should contain commands to set up aliases, functions, options, key bindings, etc.

##############################################################################
# Z Shell Keybindings Configuration
##############################################################################

# To see the key combo you want to use just do:
# cat > /dev/null
# And press it

##############################################################################
# ===== Basic options == SEE http://zsh.sourceforge.net/Doc/Release/Options.html
##############################################################################
setopt ALWAYS_TO_END # move cursor to end if word had one match
setopt AUTO_CD # cd by typing directory name if it's not a command
setopt AUTO_LIST # automatically list choices on ambiguous completion
setopt AUTO_MENU # automatically use menu completion
setopt CORRECT_ALL # autocorrect commands
setopt INTERACTIVE_COMMENTS # Allow comments even in interactive shells

##############################################################################
# Z Shell Autocomplete Configuration
##############################################################################
setopt COMPLETE_IN_WORD # Allow completion from within a word/phrase
setopt ALWAYS_TO_END # When completing from the middle of a word, move the cursor to the end of the word
setopt GLOB_DOTS # Do not require a leading ‘.’ in a filename to be matched explicitly.

##############################################################################
# Z Shell History Configuration
##############################################################################
export HISTFILE=${ZDOTCACHEDIR}/.zsh_history
export HISTDUP=erase # Erase duplicates in the history file
export HISTSIZE=1000 # How many lines of history to keep in memory
export SAVEHIST=1000 # Number of history entries to save to disk
export HISTFILESIZE=1000000000

setopt APPEND_HISTORY # Allow multiple terminal sessions to all append to one zsh command history
setopt EXTENDED_HISTORY # Include more information about when the command was executed, etc
setopt HIST_IGNORE_DUPS # Do not write events to history that are duplicates of previous events
setopt HIST_REDUCE_BLANKS # remove superfluous blanks from history items
setopt INC_APPEND_HISTORY # save history entries as soon as they are entered
setopt SHARE_HISTORY # share history between different instances of the shell
setopt HIST_FIND_NO_DUPS # When searching history don't display results already cycled through twice

##############################################################################
# Z Shell Colors Configuration
##############################################################################
autoload -U colors
colors

# The colors function records the names of colors and similar attributes
# (bold, underline and so on) in the associative array color.
# echo "${(o)color}"
setopt extendedglob
autoload -Uz compaudit compinit

if [ "$(uname)" = "Darwin" ]
then
  # Darwin uses BSD style stat
  if [ "$(date +'%j')" != "$(stat -f '%Sm' -t '%j' ${ZDOTCACHEDIR}/.zcompdump)" ]
  then
    compinit -d ${ZDOTCACHEDIR}/.zcompdump
  else
    compinit -C 
  fi
else # [ "$(uname)" = "Linux" ]
  # linux uses GNU style stat
  if [ "$(date +"%Y-%m-%d")" != "$(stat -c '%.10z' ${ZDOTCACHEDIR}/.zcompdump)" ]
  then
    compinit -d ${ZDOTCACHEDIR}/.zcompdump
  else
    compinit -C 
  fi
fi 

zstyle ':completion:*' menu select
zmodload zsh/complist

##############################################################################
# Z Shell Default Prompt Configuration
##############################################################################
PROMPT='%F{cyan}%1 %/ %f %# '

##############################################################################
# source everything found in $ZDOTDEEDIR if the directory exists
##############################################################################
# load local configuration stored in $ZDOTDEEDIR
if [ -d $ZDOTDEEDIR ]
then
  for i in $ZDOTDEEDIR/*.zsh
  do
    source $i
  done
fi
