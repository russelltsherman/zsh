
if chk::linux
then
  eval $(/home/linuxbrew/.linuxbrew/bin/brew shellenv)
fi

if chk::osx
then
  eval $(/opt/homebrew/bin/brew shellenv)
fi
