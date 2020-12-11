if chk::command "nvim"
then

  # set global tty value in vim on launch
  # facilitates OSC 52 Yanks vi plugin
  alias vi='vi -c "let g:tty='\''$(tty)'\''"'

else
  echo "nvim not found. execute 'nvim::install' to install it."

  nvim::install() {
    pkg::install "neovim"
  }
fi
