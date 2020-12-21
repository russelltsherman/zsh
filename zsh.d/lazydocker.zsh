if chk::command "lazydocker"
then
  alias ld='lazydocker'
else
  chk::command "go" && go get github.com/jesseduffield/lazydocker
fi

