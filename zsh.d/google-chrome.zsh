if chk::app "google-chrome"
then

  # gch - browse chrome history
  gch() {
    cols=$(( COLUMNS / 3 ))
    sep='{::}'

    cp ~/Library/Application\ Support/Google/Chrome/Default/History /tmp/gch 
    
    sqlite3 -separator $sep /tmp/gch \
      "select substr(title, 1, $cols), url
      from urls order by last_visit_time desc" |
    awk -F $sep '{printf "%-'$cols's  \x1b[36m%s\x1b[m\n", $1, $2}' |
    fzf --ansi --multi | sed 's#.*\(https*://\)#\1#' | xargs open
  }

else
  echo "google-chrome not found. execute 'google-chrome::install' to install it."

  google-chrome::install() {
    chk::osx && pkg::install::brew::cask "google-chrome"
    
    if chk::ubuntu || chk::debian
    then
      wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb -O ~/Downloads/google-chrome.deb
      sudo apt install -y ~/Downloads/google-chrome.deb
      rm ~/Downloads/google-chrome.deb
    fi
  }
fi
