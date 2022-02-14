
# if the active profile file exists we will set the ACTIVE_PROFILE env var to it's contents
# this will allow us to scope systems to use the correct configuration for the given profile

file="${XDG_CONFIG_HOME}/active/profile"

activate(){
  profile=${1:-$ACTIVE_PROFILE}
  case $profile in
    8f|8fold)
      profile="blockhenge"
      ;;
    bhco|blockhenge)
      profile="blockhenge"
      ;;
    fb|finbotsdev)
      profile="finbotsdev"
      ;;
    ob|opsbot)
      profile="opsbots"
      ;;
    rs|russell)
      profile="russelltsherman"
      ;;
    *)
      profile="N/A"
      ;;
  esac

  echo "Active profile: $profile"
  echo "$profile" > "$file"
  export AWS_MFA_PROFILE

  # refresh files in ~/.ssh
  if test -d ${HOME}/.ssh/${profile}; then
    find ~/.ssh -type f -maxdepth 1 -exec rm -rf {} \;
    cp ${HOME}/.ssh/${profile}/*  ${HOME}/.ssh
    # refresh ssh-agent keys
    ssh-add -D &> /dev/null
    for key in ${HOME}/.ssh/id_*; do
      if grep -q PRIVATE "$key"; then
          ssh-add "$key" &> /dev/null
      fi
    done
    # ssh-add -l
  fi

  # refresh files in ~/.config/mfa
  if test -d ${HOME}/.config/mfa/${profile}; then
    find ${HOME}/.config/mfa -type f -maxdepth 1 -exec rm -rf {} \;
    cp ${HOME}/.config/mfa/${profile}/*  ${HOME}/.config/mfa
  fi

}

# systems
# ssh keys
# aws profile
# kubeconfig
# github personal access token
# gitlab personal access token
# mfa configuration

if [ -f "$file" ]
then
  ACTIVE_PROFILE="$(cat "$file")"
  activate
elif [ -z "$ACTIVE_PROFILE" ]
then
  :
fi

# it would be ideal if we could configure unique ssh config for each profile
# we could create sub folders for each profile under ~/.ssh and delete and copy files into ~/.ssh when changing profiles
