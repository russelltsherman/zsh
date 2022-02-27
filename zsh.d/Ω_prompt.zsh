#
# Impromptu ZSH
#

# Common-used variable for new line separator
NEWLINE='
'

# ------------------------------------------------------------------------------
# CONFIGURATION
# The default configuration that can be overridden in .zshrc
# ------------------------------------------------------------------------------

if [ -z "$IMPROMPTU_PROMPT_ORDER" ]
then
  IMPROMPTU_PROMPT_ORDER=(
    vi-mode       # Vi-mode indicator
    user          # Username segment
    host          # Hostname segment
    active_profile 
    aws           # Amazon Web Services segment
    aws-vault     # Amazon Web Services segment
    dir           # Current directory segment
    package       # Package version segment
    nodejs        # Node.js section segment
    ruby          # Ruby segment
    golang        # Go segment
    docker        # Docker segment
    terraform     # Terraform workspace segment
    terragrunt    # Terragrunt workspace segment
    venv          # virtualenv segment
    kubecontext   # Kubectl context segment
    git           # Git segment
    exec_time     # Execution time segment
    line_sep      # Line break segment
    jobs          # Background jobs indicator segment
    exit_code     # Exit code segment
    aws-vault-prompt # assume-role login prompt
    clock         # Clock segment
    char          # Prompt character segment
  )
fi

if [ -z "$IMPROMPTU_RPROMPT_ORDER" ]
then
  IMPROMPTU_RPROMPT_ORDER=(
    battery       # Battery level and status
  )
fi

# ------------------------------------------------------------------------------
# HOOKS
# Zsh hooks for advanced actions
# custom hooks for sections
# ------------------------------------------------------------------------------

# TODO: Let sections register their own hooks via `impromptu::register_hook`

# Execution time start
impromptu_exec_time_preexec_hook() {
  unset IMPROPMTU_EXEC_TIME
  IMPROPMTU_EXEC_TIME_start=$(date +%s)
}

# Execution time end
impromptu_exec_time_precmd_hook() {
  [[ -z $IMPROPMTU_EXEC_TIME_start ]] && return
  [[ -n $IMPROPMTU_EXEC_TIME ]] && unset IMPROPMTU_EXEC_TIME
  local IMPROPMTU_EXEC_TIME_stop
  IMPROPMTU_EXEC_TIME_stop=$(date +%s)
  export IMPROPMTU_EXEC_TIME=$(( $IMPROPMTU_EXEC_TIME_stop - $IMPROPMTU_EXEC_TIME_start ))
  unset IMPROPMTU_EXEC_TIME_start
  unset IMPROPMTU_EXEC_TIME_stop
}

# vcs_info hook
impromptu_exec_vcs_info_precmd_hook() {
  [[ $IMPROPMTU_GIT_BRANCH_SHOW == false ]] && return
  vcs_info
}

# ------------------------------------------------------------------------------
# UTILS
# ------------------------------------------------------------------------------

# Internal variable for checking if prompt is opened
impromptu_prompt_opened="$IMPROPMTU_PROMPT_FIRST_PREFIX_SHOW"

# Compose whole prompt from sections
# USAGE:
#   impromptu::compose_prompt [section...]
impromptu::compose_prompt() {
  # Option EXTENDED_GLOB is set locally to force filename generation on
  # argument to conditions, i.e. allow usage of explicit glob qualifier (#q).
  # See the description of filename generation in
  # http://zsh.sourceforge.net/Doc/Release/Conditional-Expressions.html
  setopt EXTENDED_GLOB LOCAL_OPTIONS

  for section in $@
  do
    if chk::defined "impromptu::prompt::$section"
    then
      "impromptu::prompt::$section" || continue
    fi
  done
}

impropmtu::exectime() {
  echo $IMPROPMTU_EXEC_TIME
}

# Draw prompt section (bold is used as default)
# USAGE:
#   impromptu::segment <color> [prefix] <content> [suffix]
impromptu::segment() {
  local color prefix content suffix
  [[ -n $1 ]] && color="%F{$1}"  || color="%f"
  [[ -n $2 ]] && content="$2"    || content=""

  echo -n "%{%B%}" # set bold
  if [[ "$impromptu_prompt_opened" == "true" ]] && [[ "$IMPROPMTU_PROMPT_PREFIXES_SHOW" == "true" ]]
  then
    echo -n "$prefix"
  fi

  impromptu_prompt_opened=true
  echo -n "%{%b%}" # unset bold

  echo -n "%{%B$color%}" # set color
  echo -n "$content"     # section content
  echo -n "%{%b%f%}"     # unset color

  echo -n "%{%B%}" # reset bold, if it was diabled before
  if [[ $IMPROPMTU_PROMPT_SUFFIXES_SHOW == true ]]; then
    echo -n "$suffix"
  fi
  echo -n "%{%b%}" # unset bold
}

# PROMPT
# Primary (left) prompt
impromptu::prompt() {
  # Retrieve exit code of last command to use in exit_code
  # Must be captured before any other command in prompt is executed
  # Must be the very first line in all entry prompt functions, or the value
  # will be overridden by a different command execution - do not move this line!
  RETVAL=$?

  # Should it add a new line before the prompt?
  [[ $IMPROMPTU_PROMPT_ADD_NEWLINE == true ]] && echo -n "$NEWLINE"
  impromptu::compose_prompt $IMPROMPTU_PROMPT_ORDER
}

# $RPROMPT
# Optional (right) prompt
impromptu::rprompt() {
  # Retrieve exit code of last command to use in exit_code
  RETVAL=$?

  impromptu::compose_prompt $IMPROMPTU_RPROMPT_ORDER
}

# PS2
# Continuation interactive prompt
impromptu::ps2() {
  # Retrieve exit code of last command to use in exit_code
  RETVAL=$?

  local char="${IMPROMPTU_CHAR_SYMBOL_SECONDARY="$IMPROMPTU_CHAR_SYMBOL"}"
  impromptu::segment "$IMPROMPTU_CHAR_COLOR_SECONDARY" "$char"
}

# ------------------------------------------------------------------------------
# SETUP
# Setup requirements for prompt
# ------------------------------------------------------------------------------

# Runs once when user opens a terminal
# All preparation before drawing prompt should be done here
prompt_impromptu_setup() {
  autoload -Uz vcs_info
  autoload -Uz add-zsh-hook

  # This variable is a magic variable used when loading themes with zsh's prompt
  # function. It will ensure the proper prompt options are set.
  prompt_opts=(cr percent sp subst)

  # Borrowed from promptinit, sets the prompt options in case the prompt was not
  # initialized via promptinit.
  setopt noprompt{bang,cr,percent,subst} "prompt${^prompt_opts[@]}"

  # Add exec_time hooks
  add-zsh-hook preexec impromptu_exec_time_preexec_hook
  add-zsh-hook precmd impromptu_exec_time_precmd_hook

  # Disable python virtualenv environment prompt prefix
  VIRTUAL_ENV_DISABLE_PROMPT=true

  # Configure vcs_info helper for potential use in the future
  add-zsh-hook precmd impromptu_exec_vcs_info_precmd_hook
  zstyle ':vcs_info:*' enable git
  zstyle ':vcs_info:git*' formats '%b'

  # Expose IMPROPMTU to environment variables
  PROMPT='$(impromptu::prompt)'
  RPROMPT='$(impromptu::rprompt)'
  PS2='$(impromptu::ps2)'
}

# ------------------------------------------------------------------------------
# ENTRY POINT
# An entry point of prompt
# ------------------------------------------------------------------------------

# Pass all arguments to the impromptu_setup function
prompt_impromptu_setup "$@"
