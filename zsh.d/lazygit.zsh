if chk::command "lazygit"
then
  ;
else
  chk::command "go" && go get github.com/jesseduffield/lazygit
fi

