if chk::command "newsboat"
then

else
    echo "newsboat not found. execute 'newsboat::install' to install it."

    newsboat::install() {
      pkg::install "newsboat"
    }
fi
