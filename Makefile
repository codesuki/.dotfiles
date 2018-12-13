.PHONY: all zsh vim ssh git

.PHONY: antibody
antibody:
	brew install getantibody/tap/antibody

.PHONY: zsh
zsh: antibody
	cd zsh && antibody bundle < plugins.txt > plugins.sh
	ln -sf ${PWD}/zsh/zshrc ~/.zshrc
	ln -sf ${PWD}/zsh/zshenv ~/.zshenv

vim:
	ln -sf ${PWD}/vim/vimrc ~/.vimrc

ssh:
	mkdir ~/.ssh
	ln -sf ${PWD}/ssh/config ~/.ssh/config

git:
	ln -sf ${PWD}/git/gitconfig ~/.gitconfig

.PHONY: fonts
fonts:
	find . -name '*.ttf' -print0 | xargs -0 -I {} cp {} ~/Library/Fonts
