
if chk::asdf::plugin 'eksctl'
then
  eval $(eksctl completion "zsh")
else
  pkg::install::asdf eksctl https://github.com/russelltsherman/asdf-eksctl.git
fi
