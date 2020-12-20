if chk::command "gopass"
then

else
  chk::command "go" && go get github.com/gopasspw/gopass
fi
