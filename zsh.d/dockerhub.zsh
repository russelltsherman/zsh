
export DOCKERHUB_PROFILE="${ACTIVE_PROFILE}"
export DOCKERHUB_TOKEN_FILE="$XDG_CONFIG_HOME/dockerhub/$DOCKERHUB_PROFILE"

if [[ -f "$DOCKERHUB_TOKEN_FILE" ]]
then
  echo "$(head -n 1 $DOCKERHUB_TOKEN_FILE)" | docker login \
    --username "$DOCKERHUB_PROFILE" --password-stdin
fi

