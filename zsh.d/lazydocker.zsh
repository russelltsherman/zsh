if chk::command "lazydocker"
then

else
    echo "lazydocker not found. execute 'lazydocker::install' to install it."

    lazydocker::install() {
      go get github.com/jesseduffield/lazydocker
    }
fi

