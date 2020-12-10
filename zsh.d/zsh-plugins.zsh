if chk::command "antibody"
then
  # https://github.com/russelltsherman/zsh-256color
  antibody bundle russelltsherman/zsh-256color branch:main

  # A Zsh plugin to help remembering those shell aliases and Git aliases you once defined.
  # https://github.com/russelltsherman/zsh-alias-tips
  antibody bundle russelltsherman/zsh-alias-tips branch:main

  # https://github.com/russelltsherman/zsh-async
  antibody bundle russelltsherman/zsh-async branch:main

  # https://github.com/russelltsherman/zsh-aws-vault
  # antibody bundle russelltsherman/zsh-aws-vault branch:main

  # https://github.com/russelltsherman/zsh-bd
  # antibody bundle russelltsherman/zsh-bd branch:main

  # https://github.com/russelltsherman/zsh-clipboard
  # antibody bundle russelltsherman/zsh-clipboard branch:main

  # activate direnv 
  # https://github.com/russelltsherman/zsh-direnv
  antibody bundle russelltsherman/zsh-direnv branch:main

  # https://github.com/russelltsherman/zsh-docker
  antibody bundle russelltsherman/zsh-docker branch:main

  # A next-generation cd command with an interactive filter ✨
  # https://github.com/russelltsherman/zsh-enhancd
  antibody bundle russelltsherman/zsh-enhancd branch:main

  # antibody bundle russelltsherman/zsh-example branch:main

  # a common interface to extract any format compressed archive
  # https://github.com/russelltsherman/zsh-extract
  antibody bundle russelltsherman/zsh-extract branch:main

  # https://github.com/russelltsherman/zsh-gcloud
  # antibody bundle russelltsherman/zsh-gcloud branch:main

  # a collection of helper scripts for working with git
  # https://github.com/russelltsherman/zsh-git
  antibody bundle russelltsherman/zsh-git branch:main

  # a collection of helper scripts for working with git
  # https://github.com/russelltsherman/zsh-github
  antibody bundle russelltsherman/zsh-github branch:main

  # antibody bundle russelltsherman/zsh-jvm branch:main

  # enhancements for working with kubernetes
  # https://github.com/russelltsherman/zsh-k8s
  antibody bundle russelltsherman/zsh-k8s branch:main

  # virtual multifactor token generation from the terminal
  # https://github.com/russelltsherman/zsh-mfa
  antibody bundle russelltsherman/zsh-mfa branch:main

  # antibody bundle russelltsherman/zsh-mkc branch:main

  # activate node version manager
  # https://github.com/russelltsherman/zsh-nvm
  antibody bundle russelltsherman/zsh-nvm branch:main

  # https://github.com/russelltsherman/zsh-pfetch
  antibody bundle russelltsherman/zsh-pfetch branch:main 

  # Easily see what's happening on your computer's ports
  # https://github.com/russelltsherman/zsh-ports
  antibody bundle russelltsherman/zsh-ports branch:main 

  # https://github.com/russelltsherman/zsh-rvm
  antibody bundle russelltsherman/zsh-rvm branch:main

  # A modified version of oh-my-zsh's plugin colored-man-pages
  # optimized for solarized dark theme in terminal.
  # https://github.com/russelltsherman/zsh-solarized-man
  antibody bundle russelltsherman/zsh-solarized-man branch:main

  # https://github.com/russelltsherman/zsh-shell
  antibody bundle russelltsherman/zsh-shell branch:main

  # https://github.com/russelltsherman/tmux-xpanes
  antibody bundle russelltsherman/tmux-xpanes branch:main

  # https://github.com/russelltsherman/zsh-venv
  antibody bundle russelltsherman/zsh-venv branch:main

  # https://github.com/russelltsherman/zsh-vi-mode
  antibody bundle russelltsherman/zsh-vi-mode branch:main

  # Automatic time tracking for commands in ZSH using wakatime.
  # https://github.com/russelltsherman/zsh-wakatime
  antibody bundle russelltsherman/zsh-wakatime branch:main

  # https://github.com/russelltsherman/zsh-yarn
  antibody bundle russelltsherman/zsh-yarn branch:main

  # z - jump around
  # https://www.github.com/russelltsherman/zsh-z.git
  antibody bundle russelltsherman/zsh-z branch:main



  # Fish-like fast/unobtrusive autosuggestions for zsh.
  # https://github.com/zsh-users/zsh-autosuggestions
  antibody bundle zsh-users/zsh-autosuggestions

  # https://github.com/zsh-users/zsh-completions
  antibody bundle zsh-users/zsh-completions

  # This is a clean-room implementation of the Fish shell's history search feature, where you can type in any part of any command from history and then press chosen keys, such as the UP and DOWN arrows, to cycle through matches.
  # https://github.com/zsh-users/zsh-history-substring-search
  antibody bundle zsh-users/zsh-history-substring-search 

  # Fish shell-like syntax highlighting for Zsh.
  # https://github.com/zsh-users/zsh-syntax-highlighting
  antibody bundle zsh-users/zsh-syntax-highlighting

  # https://www.github.com/zsh-users/zaw.git
  antibody bundle zsh-users/zaw
else 
  echo::red "antibody command not installed skipping zsh plugin load"
fi
