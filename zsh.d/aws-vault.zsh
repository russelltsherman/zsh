if chk::command "aws-vault"
then
  #--------------------------------------------------------------------#
  # Variables                                                          #
  #--------------------------------------------------------------------#
  AWS_VAULT_PL_DEFAULT_PROFILE=${AWS_VAULT_PL_DEFAULT_PROFILE:-default}
  AWS_VAULT_PL_CHAR=${AWS_VAULT_PL_CHAR:-$'\u2601'} # "the cloud"
  AWS_VAULT_PL_BROWSER=${AWS_VAULT_PL_BROWSER:-''}
  AWS_VAULT_PL_MFA=${AWS_VAULT_PL_MFA:-''}

  AWS_SESSION_TOKEN_TTL=${AWS_SESSION_TOKEN_TTL:-1h}
  # Expiration time for the GetSessionToken credentials.
  AWS_CHAINED_SESSION_TOKEN_TTL=${AWS_CHAINED_SESSION_TOKEN_TTL:-1h}
  # Expiration time for the GetSessionToken credentials when chaining profiles.
  AWS_ASSUME_ROLE_TTL=${AWS_ASSUME_ROLE_TTL:-1h}
  # Expiration time for the AssumeRole credentials.
  AWS_FEDERATION_TOKEN_TTL=${AWS_FEDERATION_TOKEN_TTL:-1h}
  # Expiration time for the GetFederationToken credentials.
  AWS_MIN_TTL=${AWS_MIN_TTL:-5m}
  # The minimum expiration time allowed for a credential.

  export AWS_VAULT_BACKEND=${AWS_VAULT_BACKEND:-file}
  #--------------------------------------------------------------------#
  # Aliases                                                            #
  #--------------------------------------------------------------------#
  alias av='aws-vault'
  alias avs='aws-vault --server'

  # create an aws authenticated session
  awslogin() {
    echo "awslogin called from $(pwd)"

    # 
    local profile="${1:-$AWS_PROFILE}"

    if [ -z $profile ]
    then
      echo ""
      echo "select aws profile using command asp"
      echo ""
      aws_profiles
      return 1
    fi

    # if profile not specified create fuzzy finder selector

    asp $profile
    aws-vault exec $profile --mfa-token=$(mfa aws) -- zsh -l 
  }

  awslogout() {
    unset AWS_ACCESS_KEY_ID
    unset AWS_SECRET_ACCESS_KEY
    unset AWS_SESSION_TOKEN
    unset AWS_SECURITY_TOKEN
    unset AWS_SESSION_EXPIRATION
    unset AWS_VAULT
  }
  #--------------------------------------------------------------------#
  # Convenience Functions                                              #
  #--------------------------------------------------------------------#
  # avl() {
  #   aws-vault login $@
  # }

  # avll() {
  #   aws-vault login -s $@
  # }

  # ave() {
  #   aws-vault exec $@
  # }

  # avsh() {
  #   case ${AWS_VAULT_PL_MFA} in
  #     inline)
  #       aws-vault exec -t $2 $1 -- zsh
  #       ;;
  #     yubikey)
  #       totp=${2:-$1}
  #       aws-vault exec -t $(ykman oath code --single $totp) $1 -- zsh
  #       ;;
  #     *)
  #       aws-vault exec $1 -- zsh
  #       ;;
  #   esac
  # }

  # avli() {
  #   local login_url
  #   case ${AWS_VAULT_PL_MFA} in
  #     inline)
  #       login_url="$(avll -t $2 $1)"
  #       ;;
  #     yubikey)
  #       totp=${2:-$1}
  #       login_url="$(avll -t $(ykman oath code --single $totp) $1)"
  #       ;;
  #     *)
  #       login_url="$(avll $1)"
  #       ;;
  #   esac

  #   if [ $? -ne 0 ]; then
  #     echo "Could not login" >&2
  #     return 1
  #   fi

  #   local browser="$(_find_browser)"

  #   if chk::osx ; then
  #     case $browser in
  #       org.mozilla.firefox)
  #         # Ensure a profile is created (can run idempotently) and launch it as a disowned process
  #         /Applications/Firefox.app/Contents/MacOS/firefox --CreateProfile $1 2>/dev/null && \
  #         /Applications/Firefox.app/Contents/MacOS/firefox --no-remote -P $1 "${login_url}" 2>/dev/null &!
  #         ;;
  #       org.mozilla.firefoxdeveloperedition)
  #         /Applications/Firefox\ Developer\ Edition.app/Contents/MacOS/firefox --CreateProfile $1 2>/dev/null && \
  #         /Applications/Firefox\ Developer\ Edition.app/Contents/MacOS/firefox --no-remote -P $1 "${login_url}" 2>/dev/null &!
  #         ;;
  #       com.google.chrome)
  #         echo "${login_url}" | xargs -t nohup /Applications/Google\ Chrome.app/Contents/MacOS/Google\ Chrome %U --no-first-run --new-window --disk-cache-dir=$(mktemp -d /tmp/chrome.XXXXXX) --user-data-dir=$(mktemp -d /tmp/chrome.XXXXXX) > /dev/null 2>&1 &
  #         ;;
  #       com.brave.Browser)
  #         echo "${login_url}" | xargs -t nohup /Applications/Brave\ Browser.app/Contents/MacOS/Brave\ Browser %U --no-first-run --new-window --disk-cache-dir=$(mktemp -d /tmp/brave.XXXXXX) --user-data-dir=$(mktemp -d /tmp/brave.XXXXXX) > /dev/null 2>&1 &
  #         ;;
  #       *)
  #         # NOTE PRs welcome to add your browser
  #         echo "Sorry, I don't know how to launch your default browser ($browser) :-("
  #         ;;
  #     esac
  #   elif chk::linux ; then
  #     case $browser in
  #       google-chrome)
  #         echo "${login_url}" | xargs -t nohup google-chrome %U --no-first-run --new-window --start-maximized --disk-cache-dir=$(mktemp -d /tmp/chrome.XXXXXX) --user-data-dir=$(mktemp -d /tmp/chrome.XXXXXX) > /dev/null 2>&1 &
  #         ;;
  #       brave-browser)
  #         echo "${login_url}" | xargs -t nohup brave-browser %U --no-first-run --new-window --start-maximized --disk-cache-dir=$(mktemp -d /tmp/brave.XXXXXX) --user-data-dir=$(mktemp -d /tmp/brave.XXXXXX) > /dev/null 2>&1 &
  #         ;;
  #       *)
  #         # NOTE PRs welcome to add your browser
  #         echo "Sorry, I don't know how to launch your default browser ($browser) :-("
  #         ;;
  #     esac
  #   else
  #     # NOTE this is untested - PRs welcome to improve it.
  #     echo "${login_url}" | xargs xdg-open
  #   fi
  # }

  # avp() {
  #   local -a profiles
  #   local _profile_text _role
  #   if egrep -arn "^\[default\]" ~/.aws/config >/dev/null; then
  #     profiles+="default: IAM_Keys"
  #   fi
  #   for item in $(grep "\[profile " ~/.aws/config | sed -e 's/.*profile \([a-zA-Z0-9_-]*\).*/\1/' | sort); do
  #     _profile_text="$item: "
  #     _role=$(aws --profile $item configure get role_arn)
  #     if [ "$_role" != "" ]; then
  #         _profile_text+="ROLE($_role) "
  #     fi
  #     profiles+=$_profile_text
  #   done
  #   printf '%s\n' "${profiles[@]}" | column -t
  # }

  #--------------------------------------------------------------------#
  # Utility Functions                                                  #
  #--------------------------------------------------------------------#
  _find_browser() {
    if [ -n "$AWS_VAULT_PL_BROWSER" ]
    then
      # use the browser bundle specified
      echo "$AWS_VAULT_PL_BROWSER"
    elif chk::osx
    then
      # Detect the browser in launchservices
      # https://stackoverflow.com/a/32465364/808678
      local prefs=~/Library/Preferences/com.apple.LaunchServices/com.apple.launchservices.secure.plist
      plutil -convert xml1 $prefs
      grep 'https' -b3 $prefs | awk 'NR==2 {split($2, arr, "[><]"); print arr[3]}';
      plutil -convert binary1 $prefs
    elif chk::linux
    then
      # Always Chrome for now
      # NOTE PRs welcome to add your browser
      echo "google-chrome"
    else
      # TODO - other platforms
    fi
  }

  # ------------------------------------------------------------------------------
  # Impromptu Prompt Segment Function
  # ------------------------------------------------------------------------------
  impromptu::prompt::aws-vault() {
    IMPROMPTU_AWS_VAULT_SHOW="true"
    IMPROMPTU_AWS_VAULT_PREFIX="assumed "
    IMPROMPTU_AWS_VAULT_SUFFIX=" "
    IMPROMPTU_AWS_VAULT_SYMBOL="☁️ "
    IMPROMPTU_AWS_VAULT_COLOR="208"

    # Check if the aws-vault is installed
    chk::command aws-vault || return

    [[ "$IMPROMPTU_AWS_VAULT_SHOW" == "true" ]] || return

    # Is the current profile not the default profile
    [[ -z $AWS_VAULT ]] || [[ "$AWS_VAULT" == "default" ]] && return

    # Show prompt segment
    impromptu::segment "$IMPROMPTU_AWS_VAULT_COLOR" \
      "${IMPROMPTU_AWS_VAULT_PREFIX}${IMPROMPTU_AWS_VAULT_SYMBOL} ${AWS_VAULT}${IMPROMPTU_AWS_VAULT_SUFFIX}"
  }

  # ------------------------------------------------------------------------------
  # Impromptu Prompt Segment Function
  # ------------------------------------------------------------------------------
  impromptu::prompt::aws-vault-prompt() {
    IMPROMPTU_AWS_VAULT_SHOW="true"
    IMPROMPTU_AWS_VAULT_PROMPT_PREFIX=""
    IMPROMPTU_AWS_VAULT_PROMPT_SUFFIX=" "
    IMPROMPTU_AWS_VAULT_PROMPT_SYMBOL="-> Execute 'assume-role' to begin a session"
    IMPROMPTU_AWS_VAULT_PROMPT_COLOR="cyan"

    # Check if the aws-vault is installed
    chk::command aws-vault || return

    [[ "$IMPROMPTU_AWS_VAULT_SHOW" == "true" ]] || return

    [[ "$GEODESIC_SHELL" == "true" ]] || return

    # Is the current profile not the default profile
    [[ $AWS_VAULT = "" ]] || return

    # Show prompt segment
    impromptu::segment "$IMPROMPTU_AWS_VAULT_PROMPT_COLOR" \
      "${NEWLINE}${IMPROMPTU_AWS_VAULT_PROMPT_PREFIX}${IMPROMPTU_AWS_VAULT_PROMPT_SYMBOL}${IMPROMPTU_AWS_VAULT_PROMPT_SUFFIX}${NEWLINE}"
  }

fi
