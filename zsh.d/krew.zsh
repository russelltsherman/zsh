# i don't care for this installing into $HOME
# i would prefer sending it to XDG_CONFIG_HOME
# export KREW_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.krew" || printf %s "${XDG_CONFIG_HOME}/krew")"

if chk::dir "${HOME}/.krew/bin"
then
  export PATH="${PATH}:${HOME}/.krew/bin"
fi
