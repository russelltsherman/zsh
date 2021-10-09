
export GITLAB_TOKEN_FILE="${GITLAB_TOKEN_FILE:-$XDG_CONFIG_HOME/githab/token}"

if [ -f $GITLAB_TOKEN_FILE ]
then
  export GITLAB_API_TOKEN="$(head -n 1 $GITLAB_TOKEN_FILE)"
fi