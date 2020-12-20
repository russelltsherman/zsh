
if chk::asdf::plugin 'k9s'
then
  ;
else
  asdf plugin-add k9s https://github.com/looztra/asdf-k9s
  asdf install k9s $(asdf list-all k9s | tail -1)
  asdf global k9s $(asdf list k9s)
fi
