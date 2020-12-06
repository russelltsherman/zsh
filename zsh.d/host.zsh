#
# Hostname
#

# ------------------------------------------------------------------------------
# Impromptu Prompt Segment Function
# ------------------------------------------------------------------------------
impromptu::prompt::host() {
  IMPROMPTU_HOST_SHOW="true"
  IMPROMPTU_HOST_SHOW_FULL="false"
  IMPROMPTU_HOST_PREFIX="@"
  IMPROMPTU_HOST_SUFFIX=" "
  IMPROMPTU_HOST_COLOR="blue"
  IMPROMPTU_HOST_COLOR_SSH="green"

  [[ "$IMPROMPTU_HOST_SHOW" == "true" ]] || return

  local host_color host

  # Determination of what color should be used
  if [[ -n $SSH_CONNECTION ]]
  then
    host_color=$IMPROMPTU_HOST_COLOR_SSH
  else
    host_color=$IMPROMPTU_HOST_COLOR
  fi

  if [[ $IMPROMPTU_HOST_SHOW_FULL == true ]]
  then
    host="%M"
  else
    host="%m"
  fi

  impromptu::segment "$host_color" \
    "${IMPROMPTU_HOST_PREFIX}${host}${IMPROMPTU_HOST_SUFFIX}"
}
