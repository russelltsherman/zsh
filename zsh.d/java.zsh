
if chk::asdf::plugin 'java'
then
  ;
else
  pkg::install::asdf java https://github.com/halcyon/asdf-java
fi
