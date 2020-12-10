if [[ $commands[mutt] ]]
then

else
    echo "mutt not found. execute 'mutt::install' to install it."

    mutt::install() {
      pkg::install "mutt"
    }
fi
