-include $(shell curl -sSL -o .build-harness "https://raw.githubusercontent.com/opsbot/build-harness/master/templates/Makefile.build-harness"; echo .build-harness)

current_dir = $(shell pwd)

export ZDOTDIR ?= ${HOME}/.zsh

## load dependencies for this project
bootstrap:
	# symlink local zsh directory to $ZDOTDIR
	-ln -sv $(current_dir)/zsh ${ZDOTDIR}
	# symlink .zshenv to $HOME so that system will source it automatically
	-ln -sv $(current_dir)/zsh/.zshenv ${HOME}/.zshenv
	make brew
_PHONY: bootstrap
