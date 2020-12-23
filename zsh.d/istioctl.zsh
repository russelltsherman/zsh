
if chk::asdf::plugin 'istioctl'
then
  ;
else
  pkg::install::asdf istioctl https://github.com/rafik8/asdf-istioctl.git
fi
