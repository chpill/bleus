SHELL := /bin/bash
PACKAGES = $(shell cat ubuntu-packages.txt)

install:
	add-sudoers
	add-ppa
	install-packages
	change-shell-to-zsh
	install-fresh-emacs
	install-xcape

add-ppa:
	sudo add-apt-repository ppa:klaus-vormweg/awesome -y &&\
	sudo add-apt-repository ppa:git-core/ppa -y

install-packages:
	sudo apt update &&\
	sudo apt install $(PACKAGES)

add-sudoers:
	echo "chpill ALL=(ALL) NOPASSWD: ALL" | sudo tee --append /etc/sudoers

change-shell-to-zsh:
	sudo chsh -s /usr/bin/zsh chpill

install-fresh-emacs:
	sudo apt-get build-dep emacs24 &&\
	mkdir -p $(HOME)/src && cd $(HOME)/src &&\
	curl -L https://ftp.gnu.org/gnu/emacs/emacs-24.5.tar.xz | tar xJ &&\
	cd emacs-24.5 &&\
	./configure &&\
	make &&\
	sudo make install

install-xcape:
	sudo apt-get install git gcc make pkg-config libx11-dev libxtst-dev libxi-dev &&\
	mkdir -p $(HOME)/src && cd $(HOME)/src &&\
	curl -L https://github.com/alols/xcape/archive/v1.1.tar.gz | tar xz &&\
	cd xcape-1.1 &&\
	make &&\
	sudo make install
