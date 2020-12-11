export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")"

if chk::command "nvm"
then
  ##############################################################################
  # lazy load nvm
  ##############################################################################
  nvm() {
    # load nvm for real
    . "$NVM_DIR/nvm.sh"
    # reissue original command
    nvm "$@" 
    # if npm not found we will install lastest node using node version manager
    command -v npm >/dev/null 2>&1 || (nvm install node)
  }

  # ------------------------------------------------------------------------------
  # Impromptu Prompt Segment Function
  # ------------------------------------------------------------------------------
  impromptu::prompt::nvm() {
    IMPROMPTU_NODE_SHOW="true"
    IMPROMPTU_NODE_PREFIX=""
    IMPROMPTU_NODE_SUFFIX=" "
    IMPROMPTU_NODE_SYMBOL="⬢ "
    IMPROMPTU_NODE_DEFAULT_VERSION=""
    IMPROMPTU_NODE_COLOR="green"

    [[ "$IMPROMPTU_NODE_SHOW" == "true" ]] || return

    # Show NODE status only for JS-specific folders
    [[ -f package.json || -d node_modules || -f *.js ]] || return

    chk::command nvm || return

    node_version=$(nvm current 2>/dev/null)

    impromptu::segment "$IMPROMPTU_NODE_COLOR" \
      "${IMPROMPTU_NODE_PREFIX}${IMPROMPTU_NODE_SYMBOL}${node_version}${IMPROMPTU_NODE_SUFFIX}"
  }

else
  echo "nvm not found. execute 'nvm::install' to install it."

  nvm::install() {
    local version="0.37.2"
    wget -qO- https://raw.githubusercontent.com/nvm-sh/nvm/v$version/install.sh | bash
  }
fi
