
if chk::asdf::plugin 'golang'
then

  GOBIN="${HOME}/bin"
  GOPATH="$HOME"
  GOROOT="$(go env GOROOT)"
  PATH="${PATH}:${GOBIN}"
  alias gotour="\${GOPATH}/bin/gotour"
  export GOBIN
  export GOPATH
  export PATH
  export GOROOT
  export GO111MODULE=on

  # ------------------------------------------------------------------------------
  # Impromptu Prompt Segment Function
  # ------------------------------------------------------------------------------
  impromptu::prompt::golang() {
    IMPROMPTU_GOLANG_SHOW="true"
    IMPROMPTU_GOLANG_PREFIX=""
    IMPROMPTU_GOLANG_SUFFIX=" "
    IMPROMPTU_GOLANG_SYMBOL="🐹 "
    IMPROMPTU_GOLANG_COLOR="cyan"

    chk::command go || return

    [[ "$IMPROMPTU_GOLANG_SHOW" == "true" ]] || return

    # If there are Go-specific files in current directory
    [[ -f go.mod || -f *.go ]] || return

    local version=${$(asdf current golang | awk '{ print $2 }')}

    impromptu::segment "$IMPROMPTU_GOLANG_COLOR" \
      "${IMPROMPTU_GOLANG_PREFIX}${IMPROMPTU_GOLANG_SYMBOL}${version}${IMPROMPTU_GOLANG_SUFFIX}"
  }

else
  echo "golang not found. execute 'golang::install' to install it."

  golang::install() {
    asdf plugin-add golang https://github.com/kennyp/asdf-golang.git

    asdf install golang 1.15.6
    asdf global golang $(asdf list golang)
  }

fi
