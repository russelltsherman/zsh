if chk::command "docker"
then
  alias d="docker"
  alias db='docker build'
  alias de='docker exec'
  alias di='docker images'
  alias dip='docker inspect --format "{{ .NetworkSettings.IPAddress }}" $*'
  alias dlog='docker logs'
  alias dps='docker ps'
  alias dpsl='docker ps -l $*'
  alias drm='docker rm'
  alias drmi='docker rmi'
  alias drmia='docker rmi $* $(docker images -a -q)'
  alias drmid='docker rmi $* $(docker images -q -f "dangling=true")'
  alias drms='docker rm $* $(docker ps -q -f "status=exited")'
  alias drmvs='docker rm -v $* $(docker ps -q -f "status=exited")'
  alias drma='docker rm $* $(docker ps -a -q)'
  alias drmva='docker rm -v $* $(docker ps -a -q)'
  alias dsa='docker stop $* $(docker ps -q -f "status=running")'
  alias dvls='docker volume ls $*'
  alias dvrma='docker volume rm $(docker volume ls -q)'
  alias dvrmd='docker volume rm $(docker volume ls -q -f "dangling=true")'

else
  echo "docker not found. execute 'docker::install' to install it."

  docker::install() {
    chk::osx && pkg::install::brew::cask "docker"
    
    if chk::debian || chk::ubuntu
    then
      sudo apt-get update
      sudo apt-get install \
        apt-transport-https \
        ca-certificates \
        curl \
        gnupg-agent \
        software-properties-common
      curl -fsSL https://download.docker.com/linux/debian/gpg | sudo apt-key add -
      sudo add-apt-repository \
        "deb [arch=amd64] https://download.docker.com/linux/debian \
        $(lsb_release -cs) \
        stable"
      sudo apt-get update
      sudo apt-get install docker-ce docker-ce-cli containerd.io
    fi
  }
fi
