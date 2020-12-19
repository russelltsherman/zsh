
if chk::asdf::plugin 'eksctl'
then
  eval $(eksctl completion "zsh")

else
  echo "eksctl not found. execute 'eksctl::install' to install it."

  eksctl::install() {
    asdf plugin-add eksctl https://github.com/elementalvoid/asdf-eksctl.git

    asdf install eksctl 0.34.0
    asdf global eksctl $(asdf list eksctl)
  }
fi
