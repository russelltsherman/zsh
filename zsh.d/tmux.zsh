
if chk::asdf::plugin 'tmux'
then
  ;
else
  pkg::install::asdf tmux https://github.com/aphecetche/asdf-tmux.git
fi
