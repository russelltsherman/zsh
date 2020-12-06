#
# Working directory
#

# ------------------------------------------------------------------------------
# Impromptu Prompt Segment Function
# ------------------------------------------------------------------------------
impromptu::prompt::dir() {
  IMPROMPTU_DIR_SHOW="true"
  IMPROMPTU_DIR_PREFIX="in "
  IMPROMPTU_DIR_SUFFIX="/ "
  IMPROMPTU_DIR_TRUNC="3"
  IMPROMPTU_DIR_TRUNC_PREFIX="..."
  IMPROMPTU_DIR_TRUNC_REPO="true"
  IMPROMPTU_DIR_COLOR="cyan"
  IMPROMPTU_DIR_LOCK_SYMBOL=" "
  IMPROMPTU_DIR_LOCK_COLOR="red"

  [[ "$IMPROMPTU_DIR_SHOW" == "true" ]] || return

  local dir
  local trunc_prefix

  if [[ IMPROMPTU_DIR_TRUNC -gt 0 ]]
  then
    # `%(N~|TRUE-TEXT|FALSE-TEXT)` replaces `TRUE-TEXT` if the current path,
    # with prefix replacement, has at least N elements relative to the root
    # directory else `FALSE-TEXT`.
    # See "Prompt Expansion" under the Zsh manual.
    trunc_prefix="%($((IMPROMPTU_DIR_TRUNC + 1))~|$IMPROMPTU_DIR_TRUNC_PREFIX|)"
  fi

  dir="$trunc_prefix%${IMPROMPTU_DIR_TRUNC}~"

  if [[ ! -w . ]]
  then
    IMPROMPTU_DIR_SUFFIX="%F{$IMPROMPTU_DIR_LOCK_COLOR}${IMPROMPTU_DIR_LOCK_SYMBOL}%f${IMPROMPTU_DIR_SUFFIX}"
  fi

  impromptu::segment "$IMPROMPTU_DIR_COLOR" \
    "${IMPROMPTU_DIR_PREFIX}${dir}${IMPROMPTU_DIR_SUFFIX}"
}
