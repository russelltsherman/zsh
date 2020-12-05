# zsh

portable zshell customizations

## Quick Start

On a fresh mac you won't have git or other required dependencies installed..
open a Terminal and run...

```sh
curl https://raw.githubusercontent.com/russelltsherman/zsh/master/bin/bootstrap | bash
```

## Usage

the slower start

1. `git clone https://github.com/russelltsherman/zsh` to pull down the repository
1. `make init` to initialize the [`build-harness`](https://github.com/russelltsherman/build-harness/)
1. `make bootstrap` to load project dependencies

## Customize

add your own customizations by placing scripts in the `zsh.d` directory. any files in this directory which include the file extension .zsh will be loaded automatically.
