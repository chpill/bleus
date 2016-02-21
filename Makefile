SHELL := /bin/bash

init:
	git submodule update --init --depth 1

stow-dotfiles: init
	cd dotfiles && stow -v -t ~ *

# Use the fzf custom installer, just say yes to all, it seems smart enough to
# not modify the dotfiles if they already exist
install-fzf: stow-dotfiles
	~/.fzf/install

unstow-dotfiles:
	cd dotfiles && stow -vD -t ~ *

.PHONY init stow-dotfiles unstow-dotfiles
