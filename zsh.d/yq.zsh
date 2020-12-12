
if chk::command "yq"
then
  ;
else
  echo "yq not found. execute 'yq::install' to install it."

  yq::install() {
    GO111MODULE=on go get github.com/mikefarah/yq/v3
  }
fi
