-include $(shell curl -sSL -o .build-harness "https://raw.githubusercontent.com/opsbot/build-harness/master/templates/Makefile.build-harness"; echo .build-harness)


## load dependencies for this project
bootstrap:
	make brew
_PHONY: bootstrap
