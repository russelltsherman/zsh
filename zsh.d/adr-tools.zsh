export ADR_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.adr" || printf %s "${XDG_CONFIG_HOME}/adr")"

if chk::command "adr"
then
  export PATH="${PATH}:${HOME}/.adr/src"

else
  echo "adr-tools not found. execute 'adr::install' to install it."

  adr::install() {
    git clone https://github.com/npryce/adr-tools $ADR_DIR
  }
fi
