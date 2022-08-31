
export GITLAB_PROFILE="${ACTIVE_PROFILE}"
export GITLAB_TOKEN_FILE="$XDG_CONFIG_HOME/gitlab/$GITLAB_PROFILE"

if [[ -f "$GITLAB_TOKEN_FILE" ]]
then
  GITLAB_TOKEN="$(head -n 1 $GITLAB_TOKEN_FILE)"
  export GITLAB_TOKEN
  export GITLAB_URL="https://www.gitlab.com"
  export GITLABBER_CLONE_METHOD="ssh"
else
  unset GITLAB_TOKEN
  unset GITLAB_URL
  unset GITLABBER_CLONE_METHOD
fi

