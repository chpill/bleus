SHELL := /bin/bash

init:
	git submodule update --init --depth 1

stow-dotfiles:
	cd dotfiles && stow -v -t ~ *

unstow-dotfiles:
	cd dotfiles && stow -vD -t ~ *

