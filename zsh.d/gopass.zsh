if chk::command "gopass"
then

else
    echo "gopass not found. execute 'gopass::install' to install it."

    gopass::install() {
      GO111MODULE=on go get github.com/gopasspw/gopass
    }
fi
