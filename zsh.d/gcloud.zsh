
if chk::asdf::plugin 'gcloud'
then
  ;
else
  echo "gcloud not found. execute 'gcloud::install' to install it."

  gcloud::install() {
    asdf plugin-add gcloud https://github.com/jthegedus/asdf-gcloud.git

    asdf install gcloud $(asdf list-all gcloud | tail -1)
    asdf global gcloud $(asdf list gcloud)
  }

fi
