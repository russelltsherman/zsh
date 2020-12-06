#
# Background jobs
#

# ------------------------------------------------------------------------------
# Impromptu Prompt Segment Function
# ------------------------------------------------------------------------------
impromptu::prompt::jobs() {
  IMPROMPTU_JOBS_SHOW="true"
  IMPROMPTU_JOBS_PREFIX=""
  IMPROMPTU_JOBS_SUFFIX=""
  IMPROMPTU_JOBS_SYMBOL="✦"
  IMPROMPTU_JOBS_COLOR="blue"
  IMPROMPTU_JOBS_AMOUNT_PREFIX=""
  IMPROMPTU_JOBS_AMOUNT_SUFFIX=""
  IMPROMPTU_JOBS_AMOUNT_THRESHOLD="1"

  [[ "$IMPROMPTU_JOBS_SHOW" == "true" ]] || return

  local jobs_amount=$( jobs -d | awk '!/pwd/' | wc -l | tr -d " ")

  [[ $jobs_amount -gt 0 ]] || return

  if [[ $jobs_amount -le $IMPROMPTU_JOBS_AMOUNT_THRESHOLD ]]
  then
    jobs_amount=''
    IMPROMPTU_JOBS_AMOUNT_PREFIX=''
    IMPROMPTU_JOBS_AMOUNT_SUFFIX=''
  fi

  impromptu::segment "$IMPROMPTU_JOBS_COLOR" \
    "${IMPROMPTU_JOBS_PREFIX}${IMPROMPTU_JOBS_SYMBOL}${IMPROMPTU_JOBS_AMOUNT_PREFIX}${jobs_amount}${IMPROMPTU_JOBS_AMOUNT_SUFFIX}${IMPROMPTU_JOBS_SUFFIX}"
}
