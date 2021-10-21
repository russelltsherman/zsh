
if chk::command "terraform"
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

  #--------------------------------------------------------------------#
  # Aliases                                                            #
  #--------------------------------------------------------------------#
  alias tf='terraform'
  alias tfa='terraform apply'
  alias tfaa='terraform apply --auto-approve'
  alias tfc='terraform console'
  alias tfd='terraform destroy'
  alias tfda='terraform destroy --auto-approve'
  alias tff='terraform fmt'
  alias tfi='terraform init'
  alias tfge='terraform get'
  alias tfgr='terraform graph'
  alias tfo='terraform output'
  alias tfpl='terraform plan'
  alias tfpr='terraform providers'
  alias tfs='terraform show'
  alias tfva='terraform validate'
  alias tfve='terraform version'
fi
