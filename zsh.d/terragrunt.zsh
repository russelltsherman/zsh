
if chk::asdf::plugin 'terragrunt'
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
    IMPROMPTU_TGENV_COLOR="cyan"

    chk::command tgenv || return
    chk::command terragrunt || return

    [[ "$IMPROMPTU_TGENV_SHOW" == "true" ]] || return

    # Show TGENV status only for terragrunt.hcl folders
    [[ -f .terrgrunt-version || -f terragrunt.hcl ]] || return

    local version="$(asdf current terragrunt | awk '{ print $2 }')"

    impromptu::segment "$IMPROMPTU_TGENV_COLOR" \
      "${IMPROMPTU_TGENV_PREFIX}${IMPROMPTU_TGENV_SYMBOL}${version}${IMPROMPTU_TGENV_SUFFIX}"
  }

else
  echo "terragrunt not found. execute 'terragrunt::install' to install it."

  terragrunt::install() {
    asdf plugin-add terragrunt https://github.com/lotia/asdf-terragrunt.git

    asdf install terragrunt 0.23.40
    asdf install terragrunt 0.24.4
    asdf install terragrunt 0.25.5
    asdf install terragrunt $(asdf list-all terragrunt | tail -1)
    asdf global terragrunt $(asdf list terragrunt)
  }

fi

