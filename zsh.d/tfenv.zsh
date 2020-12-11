export TFENV_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.tfenv" || printf %s "${XDG_CONFIG_HOME}/tfenv")"

if chk::command "tfenv"
then
  # ------------------------------------------------------------------------------
  # Impromptu Prompt Segment Function
  # ------------------------------------------------------------------------------
  impromptu::prompt::tfenv() {
    IMPROMPTU_TFENV_SHOW="true"
    IMPROMPTU_TFENV_PREFIX=""
    IMPROMPTU_TFENV_SUFFIX=" "
    IMPROMPTU_TFENV_SYMBOL="🛠 "
    IMPROMPTU_TFENV_COLOR="105"

    chk::command tfenv || return
    chk::command terraform || return

    [[ "$IMPROMPTU_TFENV_SHOW" == "true" ]] || return

    # Show Terraform Workspaces when exists
    [[ -f .terraform/environment ]] || return

    local terraform_workspace=$(<.terraform/environment)
    [[ -z $terraform_workspace ]] && return

    local version="$(terraform version | awk '{ print $2 }')"

    impromptu::segment "$IMPROMPTU_TFENV_COLOR" \
      "${IMPROMPTU_TFENV_PREFIX}${IMPROMPTU_TFENV_SYMBOL}${terraform_workspace}${IMPROMPTU_TFENV_SUFFIX}"
  }

else
  echo "tfenv not found. execute 'tfenv::install' to install it."

  tfenv::install() {
    git clone https://github.com/tfutils/tfenv.git $TFENV_DIR
    ln -s $TFENV_DIR/bin/* /usr/local/bin

  	tfenv install 0.12.29
  	tfenv install 0.13.5
  	tfenv install 0.14.0
  	tfenv use 0.12.29
  }
fi
