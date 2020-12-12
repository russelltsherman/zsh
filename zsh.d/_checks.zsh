# chk::app checks if a given app is installed
# usage:
#     chk::app "slack" || echo::red "slack not installed"
chk::app() {
  local app="${1}"
  chk::osx && mdfind "kMDItemKind == 'Application'" | grep -i "${app//-/ }" &> /dev/null && return 0
  chk::linux && chk::command "$pkg" && return 0
}

# chk::contains returns true if a given list contains a given value
# usage:
#     chk::contains "one two three" "three" && red "found it"
chk::contains() {
  local list="$1"
  local item="$2"
  [[ $list =~ (^|[[:space:]])"$item"($|[[:space:]]) ]]
}

# chk::command checks if a given string would currently be interpreted by the shell as a command or alias.
# usage:
#     chk::command ll || alias ll='ls -l'
chk::command() {
	command -v $1 >/dev/null
}

# Check if function is defined
# USAGE:
#   chk::defined 'chk::defined' || echo::red "function not defined"
chk::defined() {
  typeset -f + "$1" &> /dev/null
}

# chk::empty returns true if a given value is empty
# usage:
#     chk::empty "xx" || echo::red "not empty"
chk::empty() {
  local var="$1"
  [ -z "$var" ]
}

# chk::file returns true if the given value is a file
# usage:
#     chk::file ~/.zshenvrc || echo::red "not a file"
chk::file() {
  local file="$1"
  [ -f "$file" ]
}

# chk::debian returns true if this OS is Debian Linux
# usage:
#     chk::debian && echo::green "this is Debian Linux"
chk::debian() {
  uname -a | grep "Debian" &> /dev/null
}

# chk::dir returns true if a given value is a directory
# usage:
#     chk::dir ~/ || echo::red "not a directory"
chk::dir() {
  local dir="$1"
  [ -d "$dir" ]
}

# Check if the current directory is in a Git repository.
# USAGE:
#   chk::git || echo::red "not a git repo"
chk::git() {
  [[ $(command git rev-parse --is-inside-work-tree 2>/dev/null) == true ]]
}

# Check if the current directory is in a Mercurial repository.
# USAGE:
#   chk::hg || echo::red "not a mercurial repo"
chk::hg() {
  local root="$(pwd -P)"

  while [ "$root" ] && [ ! -d "$root/.hg" ]
  do
    root="${root%/*}"
  done

  [[ -n "$root" ]] &>/dev/null
}

# chk::linux returns true if this OS is Linux
# usage:
#     chk::linux && echo::green "this is Linux"
chk::linux() {
  uname -a | grep "Linux" &> /dev/null
}

# chk::number returns true if a given value is a number
# usage:
#     chk::number "S" || echo::red "this isn't a number"
chk::number() {
  local value="$1"
  [[ "$value" =~ ^[0-9]+$ ]]
}

# chk::osx returns true if this OS is Darwin
# usage:
#     chk::osx && echo::green "this is Mac OS"
chk::osx() {
  uname -a | grep "Darwin" &> /dev/null
}

# chk::ubuntu returns true if this OS is Ubuntu Linux
# usage:
#     chk::ubuntu && echo::green "this is Ubuntu Linux"
chk::ubuntu() {
  uname -a | grep "Ubuntu" &> /dev/null
}

# chk::osx returns true if this OS is Windows
# usage:
#     chk::windows && echo::green "this is Windows"
chk::windows() {
  uname -a | grep "MINGW32_NT" &> /dev/null
}




## it seems a bit redundant to have negative checks given that positive checks can be used for this
# chk::empty returns true if a given value is not empty
# usage:
#     chk::not::empty "xx" && echo::green "not empty"
chk::not::empty() {
  local var="$1"
  [ -n "$var" ]
}

# chk::file returns true if the given value is not a file
# usage:
#     chk::not::file "" && echo::green "not a file"
chk::not::file() {
  local file="$1"
  [ ! -f "$file" ]
}

# chk::empty returns true if a given value is not a directory
# usage:
#     chk::not::dir "" && echo::red "not a directory"
chk::not::dir() {
  local dir="$1"
  [ ! -d "$dir" ]
}

# chk::empty returns true if a given value is not a number
# usage:
#     chk::not::number "" && echo::red "not a number"
chk::not::number() {
  local value="$1"
  [[ ! "$value" =~ ^[0-9]+$ ]]
}

# chk::not::command returns true if a given string would currently NOT be interpreted by the shell as a command.
# Because there is no easy way to invert the exit status of a command for use in an if statement
# usage:
#     chk::not::command fuck && echo::red "not a command"
chk::not::command() {
	if command -v $1 >/dev/null
    then
		return 1
	else
		return 0
	fi
}
