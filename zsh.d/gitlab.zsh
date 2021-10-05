
export GITLAB_TOKEN_FILE="${GITLAB_TOKEN_FILE:-$XDG_CONFIG_HOME/gitlab/token}"

if [ -f "$GITHUB_TOKEN_FILE" ]
then
    export GITLAB_TOKEN="$(head -n 1 $GITLAB_TOKEN_FILE)"
    export GITLAB_URL="https://www.gitlab.com"
    export GITLABBER_CLONE_METHOD="ssh"
fi

