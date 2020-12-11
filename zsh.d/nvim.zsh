if chk::command "nvim"
then

else
  echo "nvim not found. execute 'nvim::install' to install it."

  nvim::install() {
    pkg::install "neovim"
  }
fi
