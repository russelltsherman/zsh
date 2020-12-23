
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
  pkg::install::asdf terraform https://github.com/Banno/asdf-hashicorp.git
fi

