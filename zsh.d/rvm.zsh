export RVM_DIR="$HOME/.rvm"

if [[ -s "$RVM_DIR/scripts/rvm" ]]
then
  # Load RVM into a shell session *as a function*
  . "$RVM_DIR/scripts/rvm" 

  # Add RVM to PATH for scripting. 
  # Make sure this is the last PATH variable change.
  export PATH="$PATH:$RVM_DIR/bin"

  rvm::update() {
    rvm get head
    rvm reload
  }

  alias gemsets='rvm gemset list'
  alias rubies='rvm list rubies'

  # ------------------------------------------------------------------------------
  # Impromptu Prompt Segment Function
  # ------------------------------------------------------------------------------
  impromptu::prompt::rbenv() {
    IMPROMPTU_RBENV_SHOW="true"
    IMPROMPTU_RBENV_PREFIX=""
    IMPROMPTU_RBENV_SUFFIX=" "
    IMPROMPTU_RBENV_SYMBOL="💎 "
    IMPROMPTU_RBENV_COLOR="red"

    chk::command ruby || return

    [[ "$IMPROMPTU_RBENV_SHOW" == "true" ]] || return

    # Show versions only for Ruby-specific folders
    [[ -f Gemfile || -f Rakefile || -f *.rb ]] || return

    local ruby_version
    ruby_version=$(ruby --version | awk '{ print $2 }')

    # Add 'v' before ruby version that starts with a number
    [[ "${ruby_version}" =~ ^[0-9].+$ ]] && ruby_version="v${ruby_version}"

    impromptu::segment "$IMPROMPTU_RBENV_COLOR" \
      "${IMPROMPTU_RBENV_PREFIX}${IMPROMPTU_RBENV_SYMBOL}${ruby_version}${IMPROMPTU_RBENV_SUFFIX}"
  }
else
  echo "$RVM_DIR/scripts/rvm not found. execute 'rvm::install' to install it."

  rvm::install() {
    curl -sSL https://get.rvm.io | bash
  }
fi 

