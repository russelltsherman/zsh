#
# Username
#

# ------------------------------------------------------------------------------
# Impromptu Prompt Segment Function
# ------------------------------------------------------------------------------
impromptu::prompt::user() {
  IMPROMPTU_USER_SHOW="true"
  IMPROMPTU_USER_PREFIX=""
  IMPROMPTU_USER_SUFFIX=""
  IMPROMPTU_USER_COLOR="yellow"
  IMPROMPTU_USER_COLOR_ROOT="red"

  [[ "$IMPROMPTU_USER_SHOW" == "true" ]] || return

  local user_color

  if [[ $USER == 'root' ]]; then
    user_color="$IMPROMPTU_USER_COLOR_ROOT"
  else
    user_color="$IMPROMPTU_USER_COLOR"
  fi

  impromptu::segment "$user_color" \
    "${IMPROMPTU_USER_PREFIX}${USER}${IMPROMPTU_USER_SUFFIX}"
}
