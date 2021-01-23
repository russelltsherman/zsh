
# install asdf plugin and latest version
# USAGE:
#   pkg::install::asdf pluginname pluginrepo
pkg::install::asdf() {
  local pkg="${1}"
  local repo="${2}"

  asdf plugin-add $pkg $repo
  asdf install $pkg $(asdf list-all $pkg | grep -v a | grep -v e | grep -v c | grep -v y | tail -1 | xargs)
  asdf global $pkg $(asdf list $pkg | tail -1 | xargs)
}

# install package using homebrew
# USAGE:
#   pkg::install::brew packagename
pkg::install::brew() {
  local pkg="${1}"
  brew install "$pkg"
}

# install package using homebrew cask
# USAGE:
#   pkg::install::brew::cask packagename
pkg::install::brew::cask() {
  local pkg="${1}"
  brew install --cask "$pkg"
}

# install package using apt install
# USAGE:
#   pkg::install::debian packagename [reponame]
pkg::install::debian() {
  local pkg="${1}"
  local repo="${2}"

  chk::empty "$repo" || sudo apt-add-repository --yes --update "$repo"
  sudo apt install -y "$pkg"
}

# install package
# USAGE:
#   pkg::install packagename [reponame]
pkg::install() {
  local pkg="${1}"
  local repo="${2}"

  if chk::osx
  then
    pkg::install::brew "$pkg"
  fi
  
  if chk::ubuntu || chk::debian
  then
    pkg::install::debian "$pkg" "$repo"
  fi
}

# USAGE:
#   pkg::remove::brew packagename
pkg::remove::brew() {
  local pkg="${1}"
  brew remove "$pkg"
}

# USAGE:
#   pkg::remove::debian packagename
pkg::remove::debian() {
  local pkg="${1}"
  sudo apt remove -y "$pkg"
}

# USAGE:
#   pkg::remove packagename
pkg::remove() {
  local pkg="${1}"

  if chk::osx
  then
    pkg::remove::brew "$pkg"
  fi
  
  if chk::ubuntu || chk::debian
  then
    pkg::remove::debian "$pkg"
  fi
}
