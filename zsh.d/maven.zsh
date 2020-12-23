
if chk::asdf::plugin 'maven'
then
  ;
else
  pkg::install::asdf maven https://github.com/halcyon/asdf-maven.git
fi
