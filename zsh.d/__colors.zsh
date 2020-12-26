# Files in the zsh.d directory are executed by the lexicographical order of their file names.
# This file is named _colors.zsh. The leading underscore is needed to ensure this file loads before
# other files that depend on the functions defined here. This file has no dependencies and should come first.

if chk::command "tput"
then
  # tput is installed we will use it for colors
  __clr_reset=$(tput sgr0)
  __clr_black=$(tput setaf 0)
  __clr_blue=$(tput setaf 4)
  __clr_bold=$(tput bold)
  __clr_cyan=$(tput setaf 6)
  __clr_dim=$(tput dim)
  __clr_green=$(tput setaf 2)
  __clr_magenta=$(tput setaf 5)
  __clr_red=$(tput setaf 1)
  __clr_rev=$(tput rev)
  __clr_smso=$(tput smso)
  __clr_smul=$(tput smul)
  __clr_white=$(tput setaf 7)
  __clr_yellow=$(tput setaf 3)
else
  # tput not found we will use ascii escape codes for colors
  __clr_escape="\x1b["
  __clr_reset="${__clr_escape}0m"
  __clr_black="${__clr_escape}30;1m"
  __clr_blue="${__clr_escape}34;01m"
  __clr_bold="${__clr_escape}1m"
  __clr_cyan="${__clr_escape}36;01m"
  __clr_dim="${__clr_escape}"
  __clr_green="${__clr_escape}32;01m"
  __clr_magenta="${__clr_escape}35;01m"
  __clr_red="${__clr_escape}31;01m"
  __clr_rev="${__clr_escape}7m"
  __clr_smso="${__clr_escape}7m"
  __clr_smul="${__clr_escape}4m"
  __clr_white="${__clr_escape}37;1m"
  __clr_yellow="${__clr_escape}33;01m"
fi
