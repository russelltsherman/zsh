#
# Package
#

# ------------------------------------------------------------------------------
# Impromptu Prompt Segment Function
# ------------------------------------------------------------------------------
impromptu::prompt::package() {
  IMPROMPTU_PACKAGE_SHOW="true"
  IMPROMPTU_PACKAGE_PREFIX=""
  IMPROMPTU_PACKAGE_SUFFIX=" "
  IMPROMPTU_PACKAGE_SYMBOL="📦 "
  IMPROMPTU_PACKAGE_COLOR="red"

  chk::command npm || return
  
  [[ "$IMPROMPTU_PACKAGE_SHOW" == "true" ]] || return

  # Show package version only when repository is a package
  local package_version

  if [[ -f package.json ]] 
  then
    if chk::command jq
    then
      package_version=$(jq -r '.version' package.json 2>/dev/null)
    elif chk::command node
    then
      package_version=$(node -p "require('./package.json').version" 2> /dev/null)
    fi
  fi

  [[ -z $package_version || "$package_version" == "null" || "$package_version" == "undefined" ]] && return

  impromptu::segment "$IMPROMPTU_PACKAGE_COLOR" \
    "${IMPROMPTU_PACKAGE_PREFIX}${IMPROMPTU_PACKAGE_SYMBOL}v${package_version}${IMPROMPTU_PACKAGE_SUFFIX}"
}
