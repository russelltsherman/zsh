if chk::command "go"
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

    local go_version
    go_version=$(go version | awk '{ if ($3 ~ /^devel/) {print $3 ":" substr($4, 2)} else {print "v" substr($3, 3)} }')

    impromptu::segment "$IMPROMPTU_GOLANG_COLOR" \
      "${IMPROMPTU_GOLANG_PREFIX}${IMPROMPTU_GOLANG_SYMBOL}${go_version}${IMPROMPTU_GOLANG_SUFFIX}"
  }

else
    echo "go not found. execute 'go::install' to install it."

    go::install() {
      local version="1.15.6"

      if chk::osx
      then
        wget https://golang.org/dl/go$version.darwin-amd64.pkg
        open go$version.darwin-amd64.pkg
      fi
      
      if chk::ubuntu
      then
        wget https://golang.org/dl/go$version.linux-amd64.tar.gz
        sudo tar -xvf go$version.linux-amd64.tar.gz
        sudo mv go /usr/local
        rm go$version.linux-amd64.tar.gz
      fi
    }
fi
