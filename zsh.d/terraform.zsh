
if chk::asdf::plugin 'terraform'
then

  # ------------------------------------------------------------------------------
  # Impromptu Prompt Segment Function
  # ------------------------------------------------------------------------------
  impromptu::prompt::terraform() {
    IMPROMPTU_TFENV_SHOW="true"
    IMPROMPTU_TFENV_PREFIX=""
    IMPROMPTU_TFENV_SUFFIX=" "
    IMPROMPTU_TFENV_SYMBOL="🛠 "
    IMPROMPTU_TFENV_COLOR="105"

    chk::command tfenv || return
    chk::command terraform || return

    [[ "$IMPROMPTU_TFENV_SHOW" == "true" ]] || return

    [[ -f .terraform-version || -f *.tf ]] || return

    local version="$(asdf current terraform | awk '{ print $2 }')"

    impromptu::segment "$IMPROMPTU_TFENV_COLOR" \
      "${IMPROMPTU_TFENV_PREFIX}${IMPROMPTU_TFENV_SYMBOL}${version}${IMPROMPTU_TFENV_SUFFIX}"
  }

else
  asdf plugin-add terraform https://github.com/Banno/asdf-hashicorp.git
  asdf install terraform 0.12.29
  asdf install terraform 0.13.5
  asdf install terraform 0.14.3
  asdf install terraform $(asdf list-all terraform | grep -v alpha | grep -v beta | grep -v rc | tail -1)
  asdf global terraform $(asdf list terraform)
fi

