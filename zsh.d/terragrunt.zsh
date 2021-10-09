
if chk::command "terragrunt"
then
  # ------------------------------------------------------------------------------
  # Impromptu Prompt Segment Function
  # ------------------------------------------------------------------------------
  impromptu::prompt::terragrunt() {
    IMPROMPTU_TGENV_SHOW="true"
    IMPROMPTU_TGENV_PREFIX=""
    IMPROMPTU_TGENV_SUFFIX=" "
    IMPROMPTU_TGENV_SYMBOL="TG "
    IMPROMPTU_TGENV_DEFAULT_VERSION=""
    IMPROMPTU_TGENV_COLOR="blue"

    chk::command tgenv || return
    chk::command terragrunt || return

    [[ "$IMPROMPTU_TGENV_SHOW" == "true" ]] || return

    # Show TGENV status only for terragrunt.hcl folders
    [[ -f .terrgrunt-version || -f terragrunt.hcl ]] || return

    local tgversion="$(terragrunt version 2>/dev/null)"
    local version="$(echo $tgversion | grep TGENV_VERSION | awk '{ print $4 }')"

    impromptu::segment "$IMPROMPTU_TGENV_COLOR" \
      "${IMPROMPTU_TGENV_PREFIX}${IMPROMPTU_TGENV_SYMBOL}${version}${IMPROMPTU_TGENV_SUFFIX}"
  }
fi
