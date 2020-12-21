
if chk::asdf::plugin 'golang'
then

  export GOBIN="${HOME}/bin"
  export GOPATH="$HOME"
  export GOROOT="$(go env GOROOT)"
  export PATH="${PATH}:${GOBIN}"
  export GO111MODULE=on

  alias gotour="\${GOPATH}/bin/gotour"

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
  asdf plugin-add golang https://github.com/kennyp/asdf-golang.git
  asdf install golang $(asdf list-all golang | grep -v beta | grep -v rc | tail -1)
  asdf global golang $(asdf list golang)
fi
