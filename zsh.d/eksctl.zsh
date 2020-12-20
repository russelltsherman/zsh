
if chk::asdf::plugin 'eksctl'
then
  eval $(eksctl completion "zsh")

else
  echo "eksctl not found. execute 'eksctl::install' to install it."

  eksctl::install() {
    asdf plugin-add eksctl https://github.com/russelltsherman/asdf-eksctl.git
    asdf install eksctl $(asdf list eksctl | grep -v rc | tail -1)
    asdf global eksctl $(asdf list eksctl)
  }
fi
