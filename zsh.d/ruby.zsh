
if chk::asdf::plugin 'ruby'
then

  # ------------------------------------------------------------------------------
  # Impromptu Prompt Segment Function
  # ------------------------------------------------------------------------------
  impromptu::prompt::ruby() {
    IMPROMPTU_RBENV_SHOW="true"
    IMPROMPTU_RBENV_PREFIX=""
    IMPROMPTU_RBENV_SUFFIX=" "
    IMPROMPTU_RBENV_SYMBOL="💎 "
    IMPROMPTU_RBENV_COLOR="red"

    chk::command ruby || return

    [[ "$IMPROMPTU_RBENV_SHOW" == "true" ]] || return

    # Show versions only for Ruby-specific folders
    [[ -f Gemfile || -f Rakefile || -f *.rb ]] || return

    local ruby_version=$(ruby --version | awk '{ print $2 }')

    # Add 'v' before ruby version that starts with a number
    [[ "${ruby_version}" =~ ^[0-9].+$ ]] && ruby_version="v${ruby_version}"

    impromptu::segment "$IMPROMPTU_RBENV_COLOR" \
      "${IMPROMPTU_RBENV_PREFIX}${IMPROMPTU_RBENV_SYMBOL}${ruby_version}${IMPROMPTU_RBENV_SUFFIX}"
  }

else
  echo "ruby not found. execute 'ruby::install' to install it."

  ruby::install() {
    asdf plugin-add ruby https://github.com/asdf-vm/asdf-ruby.git

    asdf install ruby 2.7.2
    asdf global ruby $(asdf list ruby)
  }

fi

