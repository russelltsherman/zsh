
if chk::command "node"
then
  # ------------------------------------------------------------------------------
  # Impromptu Prompt Segment Function
  # ------------------------------------------------------------------------------
  impromptu::prompt::nodejs() {
    IMPROMPTU_NODE_SHOW="true"
    IMPROMPTU_NODE_PREFIX=""
    IMPROMPTU_NODE_SUFFIX=" "
    IMPROMPTU_NODE_SYMBOL="⬢ "
    IMPROMPTU_NODE_DEFAULT_VERSION=""
    IMPROMPTU_NODE_COLOR="green"

    [[ "$IMPROMPTU_NODE_SHOW" == "true" ]] || return

    # Show NODE status only for JS-specific folders
    [[ -f package.json || -d node_modules || -f *.js ]] || return

    chk::command node || return

    local version=$(asdf current nodejs | awk '{ print $2 }')

    impromptu::segment "$IMPROMPTU_NODE_COLOR" \
      "${IMPROMPTU_NODE_PREFIX}${IMPROMPTU_NODE_SYMBOL}${version}${IMPROMPTU_NODE_SUFFIX}"
  }
fi

