# zsh::reload reload shell configuration
# usage:
#     zsh::reload 
zsh::reload() {
 exec ${SHELL} -l
}

# zsh::update pull upstream zsh and plugin updates
# usage:
#     zsh::update 
zsh::update() {
  # get upstream changes from zsh repo
  cd $ZDOTDIR && git stash save; git pull; git stash pop
  # zsh-enhancd deletes unused files on init and leaves the git repo in a dirty state
  # we will hard reset it before calling anitbody update
  cd $(antibody home)/https-COLON--SLASH--SLASH-github.com-SLASH-russelltsherman-SLASH-zsh-enhancd && git reset head --hard
  # update all antibody plugins
  antibody update
  # clear the screen
  clear 
  # reload shell
  zsh::reload
}
