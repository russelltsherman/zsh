
if chk::linux
then
  eval $(/home/linuxbrew/.linuxbrew/bin/brew shellenv)
fi

if chk::osx
then
  f=/opt/homebrew/bin/brew
  if test -f "$f"
  then
    eval $($f shellenv)
  fi

  f=/usr/local/bin/brew
  if test -f "$f"
  then
    eval $($f shellenv)
  fi
fi
