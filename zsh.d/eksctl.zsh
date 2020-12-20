
if chk::asdf::plugin 'eksctl'
then
  eval $(eksctl completion "zsh")

else
  asdf plugin-add eksctl https://github.com/russelltsherman/asdf-eksctl.git
  asdf install eksctl $(asdf list-all eksctl | grep -v rc | tail -1)
  asdf global eksctl $(asdf list eksctl)
fi
