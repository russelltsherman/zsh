#
# Line separator
#

# ------------------------------------------------------------------------------
# Impromptu Prompt Segment Function
# ------------------------------------------------------------------------------
impromptu::prompt::line_sep() {
  [[ "$IMPROMPTU_PROMPT_SEPARATE_LINE" == "true" ]] && echo -n "$NEWLINE"
}
