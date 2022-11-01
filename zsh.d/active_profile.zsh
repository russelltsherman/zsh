
# if the active profile file exists we will set the ACTIVE_PROFILE env var to it's contents
# this will allow us to scope systems to use the correct configuration for the given profile

if [[ ! -d "${XDG_CONFIG_HOME}/active" ]]
  mkdir -p "${XDG_CONFIG_HOME}/active"
then
fi


file="${XDG_CONFIG_HOME}/active/profile"

be(){
  if [[ -f "$file" ]]
  then
    ACTIVE_PROFILE="$(cat "$file")"
  fi

  profile=${1:-$ACTIVE_PROFILE}

  case $profile in
    bh|bhco|ef|blockhenge)
      profile="blockhenge"
      ;;
    fb|finbots|finbotsdev)
      profile="finbotsdev"
      ;;
    ob|opsbots)
      profile="opsbots"
      ;;
    pa|paymentapproved)
      profile="paymentapproved"
      ;;
    po|palolo)
      profile="palolo"
      ;;
    rs|russelltsherman)
      profile="russelltsherman"
      ;;
    *)
      profile="none"
      ;;
  esac

  if [ "$ACTIVE_PROFILE" != "$profile" ]
  then
    echo "changing active profile from $ACTIVE_PROFILE to $profile"
  else
    # echo "$ACTIVE_PROFILE"
    :
  fi

  echo "$profile" > "$file"
  ACTIVE_PROFILE="$profile"
  export ACTIVE_PROFILE

  # refresh aws configuration
  if [[  -d ${HOME}/.config/profiles/${profile}/aws ]]
  then
    find ~/.aws -type f -maxdepth 1 -exec rm -rf {} \;
    cp ${HOME}/.config/profiles/${profile}/aws/*  ${HOME}/.aws
  fi

  # refresh github configuration
  if [[  -d ${HOME}/.config/profiles/${profile}/github ]]
  then
    find ~/.config/github -type f -maxdepth 1 -exec rm -rf {} \;
    cp ${HOME}/.config/profiles/${profile}/github/*  ${HOME}/.config/github
  fi

  # refresh gitlab configuration
  if [[  -d ${HOME}/.config/profiles/${profile}/gitlab ]]
  then
    find ~/.config/gitlab -type f -maxdepth 1 -exec rm -rf {} \;
    cp ${HOME}/.config/profiles/${profile}/gitlab/*  ${HOME}/.config/gitlab
  fi

  # refresh ssh configuration
  if [[ -d ${HOME}/.config/profiles/${profile}/ssh ]] 
  then
    find ~/.ssh -type f -maxdepth 1 -exec rm -rf {} \;
    cp ${HOME}/.config/profiles/${profile}/ssh/*  ${HOME}/.ssh
    # refresh ssh-agent keys
    ssh-add -D &> /dev/null
    for key in ${HOME}/.ssh/id_*; do
      if grep -q PRIVATE "$key"; then
          ssh-add "$key" &> /dev/null
      fi
    done
    # ssh-add -l
  fi

  # clear kubectl configuration
  rm -rf ${HOME}/.kube

  # refresh mfa configuration
  if [[ -d ${HOME}/.config/profiles/${profile}/mfa ]] 
  then
    find ${HOME}/.config/mfa -type f -maxdepth 1 -exec rm -rf {} \;
    key_count=$(ls ${HOME}/.config/profiles/${profile}/mfa | wc -l)
    if [[ ! $key_count -eq 0 ]]
    then
      cp ${HOME}/.config/profiles/${profile}/mfa/*  ${HOME}/.config/mfa
    fi
  fi

  # if function called with argument reload shell
  if [[ ! $# -eq 0 ]]
  then
    zsh::reload
  fi
}

# call be function without argument to load saved active profile
be 

# ------------------------------------------------------------------------------
# Impromptu Prompt Segment Function
# ------------------------------------------------------------------------------
impromptu::prompt::active_profile() {
  IMPROMPTU_AP_SHOW="true"
  IMPROMPTU_AP_PREFIX=""
  IMPROMPTU_AP_SUFFIX=" "
  IMPROMPTU_AP_SYMBOL="☁️ "
  IMPROMPTU_AP_COLOR="208"

  [[ "$IMPROMPTU_AP_SHOW" == "true" ]] || return

  # Is the current profile not the default profile
  [[ -z $ACTIVE_PROFILE ]] || [[ "$ACTIVE_PROFILE" == "N/A" ]] && return

  # Show prompt segment
  impromptu::segment "$IMPROMPTU_AP_COLOR" \
    "${IMPROMPTU_AP_PREFIX}${IMPROMPTU_AP_SYMBOL} $ACTIVE_PROFILE ${IMPROMPTU_AP_SUFFIX}"
}
