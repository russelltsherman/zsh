# ------------------------------------------------------------------------------
# Impromptu Prompt Segment Function
# ------------------------------------------------------------------------------
impromptu::prompt::venv() {
  IMPROMPTU_VENV_SHOW="true"
  IMPROMPTU_VENV_PREFIX=""
  IMPROMPTU_VENV_SUFFIX=""
  IMPROMPTU_VENV_SYMBOL="🐍 "
  # The (A) expansion flag creates an array, the '=' activates word splitting
  IMPROMPTU_VENV_GENERIC_NAMES="${(A)=IMPROMPTU_VENV_GENERIC_NAMES=virtualenv venv .venv}"
  IMPROMPTU_VENV_COLOR="blue"

  [[ "$IMPROMPTU_VENV_SHOW" == "true" ]] || return

  # Check if the current directory running via Virtualenv
  [ -n "$VIRTUAL_ENV" ] || return

  local venv="$(echo $VIRTUAL_ENV:t | cut -d'-' -f2)"
  
  impromptu::segment "$IMPROMPTU_VENV_COLOR" \
    "${IMPROMPTU_VENV_PREFIX}${IMPROMPTU_VENV_SYMBOL}${venv}${IMPROMPTU_VENV_SUFFIX}"
}
