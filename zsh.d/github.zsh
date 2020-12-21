

if chk::asdf::plugin 'github-cli'
then
  export GITHUB_TOKEN_FILE="${GITHUB_TOKEN_FILE:-$XDG_CONFIG_HOME/.github_token}"
  export GITHUB_API_TOKEN="$(head -n 1 $GITHUB_TOKEN_FILE)"
  export GITHUB_PERSONAL_ACCESS_TOKEN=$GITHUB_API_TOKEN
  ;
else
  asdf plugin-add github-cli https://github.com/russelltsherman/asdf-github-cli.git
  asdf install github-cli $(asdf list-all github-cli | grep -v pre | tail -1)
  asdf global github-cli $(asdf list github-cli)
fi
