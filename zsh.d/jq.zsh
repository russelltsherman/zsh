
if chk::asdf::plugin 'jq'
then
  ;

else
  echo "jq not found. execute 'jq::install' to install it."

  jq::install() {
    asdf plugin-add jq https://github.com/russelltsherman/asdf-jq.git

    asdf install jq $(asdf list-all jq | grep -v rc | tail -1)
    asdf global jq $(asdf list jq)
  }

fi
