if chk::command "lazygit"
then
  alias lg='lazygit'
else
  chk::command "go" && go get github.com/jesseduffield/lazygit
fi

