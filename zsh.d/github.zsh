

if chk::asdf::plugin 'github-cli'
then
  export GITHUB_TOKEN_FILE="${GITHUB_TOKEN_FILE:-$XDG_CONFIG_HOME/.github_token}"
  export GITHUB_API_TOKEN="$(head -n 1 $GITHUB_TOKEN_FILE)"
  export GITHUB_PERSONAL_ACCESS_TOKEN=$GITHUB_API_TOKEN
  ;
else
  pkg::install::asdf github-cli https://github.com/russelltsherman/asdf-github-cli.git
fi
