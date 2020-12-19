##################################################################
# superceded by asdf terragrunt
##################################################################
# export TGENV_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.tgenv" || printf %s "${XDG_CONFIG_HOME}/tgenv")"

# if chk::command "tgenv"
# then
#   # ------------------------------------------------------------------------------
#   # Impromptu Prompt Segment Function
#   # ------------------------------------------------------------------------------
#   impromptu::prompt::tgenv() {
#     IMPROMPTU_TGENV_SHOW="true"
#     IMPROMPTU_TGENV_PREFIX=""
#     IMPROMPTU_TGENV_SUFFIX=" "
#     IMPROMPTU_TGENV_SYMBOL="TG "
#     IMPROMPTU_TGENV_DEFAULT_VERSION=""
#     IMPROMPTU_TGENV_COLOR="cyan"

#     chk::command tgenv || return
#     chk::command terragrunt || return

#     [[ "$IMPROMPTU_TGENV_SHOW" == "true" ]] || return

#     # Show TGENV status only for terragrunt.hcl folders
#     [[ -f .terrgrunt-version || -f terragrunt.hcl ]] || return

#     local version="$(terragrunt version | grep TGENV_VERSION | awk '{ print $4 }' 2>/dev/null)"

#     impromptu::segment "$IMPROMPTU_TGENV_COLOR" \
#       "${IMPROMPTU_TGENV_PREFIX}${IMPROMPTU_TGENV_SYMBOL}${version}${IMPROMPTU_TGENV_SUFFIX}"
#   }

# else
#   echo "tgenv not found. execute 'tgenv::install' to install it."

#   tgenv::install() {
#     git clone https://github.com/cunymatthieu/tgenv.git $TGENV_DIR
#     ln -s $TGENV_DIR/bin/* /usr/local/bin

#     tgenv install 0.24.4
#     tgenv install 0.25.5
#     tgenv install 0.26.7
#     tgenv use 0.23.40
#   }
# fi
