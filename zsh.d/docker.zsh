
if chk::command "docker"
then
  alias d="docker"
  alias db='d build'
  alias de='d exec'
  alias di='d images'
  alias dip='d inspect --format "{{ .NetworkSettings.IPAddress }}" $*'
  alias dlog='d logs'
  alias dps='d ps'
  alias dpsl='d ps -l $*'
  alias drm='d rm'
  alias drmi='d rmi'
  alias drmia='d rmi $* $(docker images -a -q)'
  alias drmid='d rmi $* $(docker images -q -f "dangling=true")'
  alias drms='d rm $* $(docker ps -q -f "status=exited")'
  alias drmvs='d rm -v $* $(docker ps -q -f "status=exited")'
  alias drma='d rm $* $(docker ps -a -q)'
  alias drmva='d rm -v $* $(docker ps -a -q)'
  alias dsa='d stop $* $(docker ps -q -f "status=running")'

  alias dsp!='d system prune --force'

  alias dnc='d network create'
  alias dnls='d network ls'
  alias dnrm='d network rm'

  alias dvls='docker volume ls $*'
  alias dvrma='docker volume rm $(docker volume ls -q)'
  alias dvrmd='docker volume rm $(docker volume ls -q -f "dangling=true")'
fi
