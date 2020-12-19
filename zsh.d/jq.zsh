
if chk::asdf::plugin 'jq'
then
  ;

else
  echo "jq not found. execute 'jq::install' to install it."

  jq::install() {
    asdf plugin-add jq https://github.com/focused-labs/asdf-jq.git

    asdf install jq jq-1.6
    asdf global jq $(asdf list jq)
  }

fi
