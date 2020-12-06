#
# Time
#

# ------------------------------------------------------------------------------
# Impromptu Prompt Segment Function
# ------------------------------------------------------------------------------
impromptu::prompt::clock() {
  IMPROMPTU_CLOCK_SHOW="true"
  IMPROMPTU_CLOCK_PREFIX=" "
  IMPROMPTU_CLOCK_SUFFIX=" "
  IMPROMPTU_CLOCK_FORMAT="false"
  IMPROMPTU_CLOCK_12HR="false"
  IMPROMPTU_CLOCK_COLOR="yellow"

  [[ "$IMPROMPTU_CLOCK_SHOW" == "true" ]] || return

  local 'time_str'

  if [[ $IMPROMPTU_CLOCK_FORMAT != false ]]
  then
    time_str="${IMPROMPTU_CLOCK_FORMAT}"
  elif [[ $IMPROMPTU_CLOCK_12HR == true ]]
  then
    time_str="%D{%r}"
  else
    time_str="%D{%T}"
  fi

  impromptu::segment "${IMPROMPTU_CLOCK_COLOR}" \
    "${IMPROMPTU_CLOCK_PREFIX}${time_str}${IMPROMPTU_CLOCK_SUFFIX}"
}
