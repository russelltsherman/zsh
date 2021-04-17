-include $(shell curl -sSL -o .build-harness "https://raw.githubusercontent.com/opsbot/build-harness/main/templates/Makefile.build-harness"; echo .build-harness)

current_dir = $(shell pwd)

## load dependencies for this project
bootstrap:
	make brew
	# symlink local zsh directory to $ZDOTDIR
	ln -sfv $(current_dir)/zsh ${HOME}/.zsh
	# symlink local zsh.d directory to $ZDOTDEEDIR
	ln -sfv $(current_dir)/zsh.d ${HOME}/.zsh.d
	# symlink .zshenv to $HOME so that system will source it automatically
	ln -sfv $(current_dir)/zsh/.zshenv ${HOME}/.zshenv
	make shell
_PHONY: bootstrap

## set user shell to the brew installed version of zsh
shell:
	sudo chsh --shell /usr/local/bin/zsh $(whoami)
_PHONY: shell
