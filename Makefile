.PHONY: all zsh vim ssh

all: zsh vim ssh

zsh:
	ln -sf ${PWD}/zsh/zshrc ~/.zshrc

vim:
	ln -sf ${PWD}/vim/vimrc ~/.vimrc

ssh:
	ln -sf ${PWD}/ssh/config ~/.ssh/config
