#
# Execution time
#

# ------------------------------------------------------------------------------
# Impromptu Prompt Segment Function
# ------------------------------------------------------------------------------
impromptu::prompt::exec_time() {
  IMPROMPTU_EXEC_TIME_SHOW="true"
  IMPROMPTU_EXEC_TIME_PREFIX="took "
  IMPROMPTU_EXEC_TIME_SUFFIX=" "
  IMPROMPTU_EXEC_TIME_COLOR="yellow"
  IMPROMPTU_EXEC_TIME_ELAPSED="2"

  [[ "$IMPROMPTU_EXEC_TIME_SHOW" == "true" ]] || return

  EXEC_TIME=$(impropmtu::exectime)
  
  if [[ $EXEC_TIME -ge $IMPROMPTU_EXEC_TIME_ELAPSED ]]
  then
    impromptu::segment "$IMPROMPTU_EXEC_TIME_COLOR" \
      "${IMPROMPTU_EXEC_TIME_PREFIX}$(echo::displaytime $EXEC_TIME)${IMPROMPTU_EXEC_TIME_SUFFIX}"
  fi
}
