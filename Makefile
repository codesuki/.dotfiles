.PHONY: all zsh vim ssh git

all: zsh vim ssh git

zsh:
	ln -sf ${PWD}/zsh/zshrc ~/.zshrc

vim:
	ln -sf ${PWD}/vim/vimrc ~/.vimrc

ssh:
	ln -sf ${PWD}/ssh/config ~/.ssh/config

git:
	ln -sf ${PWD}/git/gitconfig ~/.gitconfig
