
# asdf
# Manage multiple runtime versions with a single CLI tool

# Bash, Zsh, Fish
# Node.js, Ruby, Python, Elixir … your favourite language?
# Extend with a simple plugin system

# see a curated list of plugins
# https://github.com/asdf-vm/asdf-plugins

export ASDF_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.asdf" || printf %s "${XDG_CONFIG_HOME}/asdf")"

if chk::dir $ASDF_DIR
then
  source $ASDF_DIR/asdf.sh

else
  echo "asdf not found. execute 'asdf::install' to install it."

  asdf::install() {
    git clone https://github.com/asdf-vm/asdf.git $ASDF_DIR --branch v0.8.0
  }
fi
