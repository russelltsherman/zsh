
if chk::asdf::plugin 'neovim'
then
  # set global tty value in vim on launch
  # facilitates OSC 52 Yanks vi plugin
  alias vi='vi -c "let g:tty='\''$(tty)'\''"'

else
  pkg::install::asdf neovim https://github.com/richin13/asdf-neovim.git
fi
