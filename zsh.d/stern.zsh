if chk::command "stern"
then
  ;
else
  echo "stern not found. execute 'stern::install' to install it."

  stern::install() {
    go get github.com/stern/stern
  }
fi
