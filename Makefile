-include $(shell curl -sSL -o .build-harness "https://raw.githubusercontent.com/opsbot/build-harness/master/templates/Makefile.build-harness"; echo .build-harness)

current_dir = $(shell pwd)

## load dependencies for this project
bootstrap:
	# symlink local zsh directory to $ZDOTDIR
	-ln -s $(current_dir)/zsh ${HOME}/.zsh
	# symlink local zsh.d directory to $ZDOTDEEDIR
	-ln -s $(current_dir)/zsh.d ${HOME}/.zsh.d
	# symlink .zshenv to $HOME so that system will source it automatically
	-ln -s $(current_dir)/zsh/.zshenv ${HOME}/.zshenv
	make brew
_PHONY: bootstrap
