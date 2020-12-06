#
# Exit code
#

# ------------------------------------------------------------------------------
# Impromptu Prompt Segment Function
# ------------------------------------------------------------------------------
impromptu::prompt::exit_code() {
  IMPROMPTU_EXIT_CODE_SHOW="true"
  IMPROMPTU_EXIT_CODE_PREFIX=""
  IMPROMPTU_EXIT_CODE_SUFFIX=" "
  IMPROMPTU_EXIT_CODE_SYMBOL="✘"
  IMPROMPTU_EXIT_CODE_COLOR="red"

  [[ "$IMPROMPTU_EXIT_CODE_SHOW" == "true" ]] || return
  
  [[ $RETVAL = 0 ]] && return

  impromptu::segment "$IMPROMPTU_EXIT_CODE_COLOR" \
    "${IMPROMPTU_EXIT_CODE_PREFIX}${IMPROMPTU_EXIT_CODE_SYMBOL}${RETVAL}${IMPROMPTU_EXIT_CODE_SUFFIX}"
}
