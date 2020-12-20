
if chk::asdf::plugin 'tmux'
then
  ;
else
  asdf plugin-add tmux https://github.com/aphecetche/asdf-tmux.git
  asdf install tmux $(asdf list-all tmux | grep -v rc | tail -1)
  asdf global tmux $(asdf list tmux)
fi
