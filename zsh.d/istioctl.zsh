
if chk::asdf::plugin 'istioctl'
then
  ;
else
  asdf plugin-add istioctl https://github.com/rafik8/asdf-istioctl.git
  asdf install istioctl $(asdf list-all istioctl | grep -v alpha  | grep -v beta | grep -v rc | tail -1)
  asdf global istioctl $(asdf list istioctl)
fi
