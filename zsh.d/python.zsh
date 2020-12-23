
if chk::asdf::plugin 'python'
then
  ;
else
  pkg::install::asdf python https://github.com/danhper/asdf-python.git
fi
