if [[ $commands[lazygit] ]]
then

else
    echo "lazygit not found. execute 'lazygit::install' to install it."

    lazygit::install() {
      go get github.com/jesseduffield/lazygit
    }
fi

