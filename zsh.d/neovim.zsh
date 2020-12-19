
if chk::asdf::plugin 'neovim'
then
  # set global tty value in vim on launch
  # facilitates OSC 52 Yanks vi plugin
  alias vi='vi -c "let g:tty='\''$(tty)'\''"'

else
  echo "neovim not found. execute 'neovim::install' to install it."

  neovim::install() {
    asdf plugin-add neovim https://github.com/richin13/asdf-neovim.git

    asdf install neovim $(asdf list-all neovim | tail -1)
    asdf global neovim $(asdf list neovim)
  }

fi
