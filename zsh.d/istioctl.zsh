
if chk::asdf::plugin 'istioctl'
then
  ;
else
  echo "istioctl not found. execute 'istioctl::install' to install it."

  istioctl::install() {
    asdf plugin-add istioctl https://github.com/rafik8/asdf-istioctl.git

    asdf install istioctl $(asdf list-all istioctl | tail -1)
    asdf global istioctl $(asdf list istioctl)
  }

fi
