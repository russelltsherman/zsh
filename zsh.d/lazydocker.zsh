if chk::command "lazydocker"
then
  ;
else
  chk::command "go" && go get github.com/jesseduffield/lazydocker
fi

