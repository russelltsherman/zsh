if chk::command "mutt"
then

else
  echo "tmux not found. execute 'tmux::install' to install it."

  tmux::install() {
    pkg::install "tmux"
  }
fi
