
if chk::asdf::plugin 'helm'
then
  ;
else
  asdf plugin-add helm https://github.com/Antiarchitect/asdf-helm.git
  asdf install helm $(asdf list-all helm | grep -v rc | tail -1) 
  asdf global helm $(asdf list helm)
fi
