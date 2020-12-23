
if chk::asdf::plugin 'nodejs'
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

else
  chk::osx && pkg::install::brew 'coreutils'
  chk::osx && pkg::install::brew 'gpg'

  chk::debian && pkg::install::debian 'curl dirmngr gpg'

  pkg::install::asdf nodejs https://github.com/asdf-vm/asdf-nodejs.git
  bash -c '${ASDF_DATA_DIR}/plugins/nodejs/bin/import-release-team-keyring'
  bash -c '${ASDF_DATA_DIR}/plugins/nodejs/bin/import-previous-release-team-keyring'

  asdf install nodejs $(asdf list-all nodejs | tail -1)
  asdf global nodejs $(asdf list nodejs)
fi

