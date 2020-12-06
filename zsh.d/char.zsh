#
# Prompt character
#

# ------------------------------------------------------------------------------
# Impromptu Prompt Segment Function
# ------------------------------------------------------------------------------
impromptu::prompt::char() {
  IMPROMPTU_CHAR_PREFIX=""
  IMPROMPTU_CHAR_SUFFIX=""
  IMPROMPTU_CHAR_SYMBOL="➜ "
  IMPROMPTU_CHAR_SYMBOL_ROOT="${IMPROMPTU_CHAR_SYMBOL_ROOT="$IMPROMPTU_CHAR_SYMBOL"}"
  IMPROMPTU_CHAR_SYMBOL_SECONDARY="${IMPROMPTU_CHAR_SYMBOL_SECONDARY="$IMPROMPTU_CHAR_SYMBOL"}"
  IMPROMPTU_CHAR_COLOR_SUCCESS="green"
  IMPROMPTU_CHAR_COLOR_FAILURE="red"
  IMPROMPTU_CHAR_COLOR_SECONDARY="yellow"

  local 'color' 'char'

  if [[ $RETVAL -eq 0 ]]
  then
    color="$IMPROMPTU_CHAR_COLOR_SUCCESS"
  else
    color="$IMPROMPTU_CHAR_COLOR_FAILURE"
  fi

  if [[ $UID -eq 0 ]]
  then
    char="$IMPROMPTU_CHAR_SYMBOL_ROOT"
  else
    char="$IMPROMPTU_CHAR_SYMBOL"
  fi

  impromptu::segment "$color" \
    "${IMPROMPTU_CHAR_PREFIX}${char}${IMPROMPTU_CHAR_SUFFIX}"
}
