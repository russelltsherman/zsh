
if chk::command "slack"
then

else
  echo "slack not found. execute 'slack::install' to install it."

  slack::install() {
    chk::osx && pkg::install::brew::cask "slack"
    
    if chk::debian
    then
      wget https://downloads.slack-edge.com/linux_releases/slack-desktop-4.11.3-amd64.deb -O ~/Downloads/slack.deb
      sudo apt install ~/Downloads/slack.deb
      rm ~/Downloads/slack.deb
    fi
  }
fi


