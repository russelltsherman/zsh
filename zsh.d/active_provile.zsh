
file="${XDG_CONFIG_HOME}/active/profile"

if [ -f "$file" ]
then
  ACTIVE_PROFILE="$(cat "$file")"
  echo "$code"
elif [ -z "$ACTIVE_PROFILE" ]
then
  echo "No active profile defined" >&2
fi

activate(){
  profile=${1}
  echo "$profile" > "$file"
}
