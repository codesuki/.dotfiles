.PHONY: all
all: brew antibody bazel zsh tmux vim ssh git fonts

.PHONY: bazel
bazel:
	ln -sf ${PWD}/bazel/bazelrc ~/.bazelrc

.PHONY: emacs
emacs:
	# disable lookup in dictionary hotkey
	defaults write com.apple.symbolichotkeys AppleSymbolicHotKeys -dict-add 70 '<dict><key>enabled</key><false/></dict>'

.PHONY: brew
brew:
	/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
	brew analytics off
	brew bundle install

.PHONY: antibody
antibody:
	brew install getantibody/tap/antibody

.PHONY: zsh
zsh: 
	cd zsh && antibody bundle < plugins.txt > plugins.sh
	ln -sf ${PWD}/zsh/zshrc ~/.zshrc
	ln -sf ${PWD}/zsh/zshenv ~/.zshenv

.PHONY: tmux
tmux:
	ln -sf ${PWD}/tmux/tmux.conf ~/.tmux.conf

.PHONY: vim
vim:
	ln -sf ${PWD}/vim/vimrc ~/.vimrc

.PHONY: ssh
ssh:
	mkdir ~/.ssh
	ln -sf ${PWD}/ssh/config ~/.ssh/config

.PHONY: git
git:
	ln -sf ${PWD}/git/gitconfig ~/.gitconfig

.PHONY: fonts
fonts:
	find . -name '*.ttf' -print0 | xargs -0 -I {} cp -v {} ~/Library/Fonts

.PHONY: gpg
gpg:
	ln -sf ${PWD}/gpg/gpg.conf ~/.gnupg/gpg.conf
	ln -sf ${PWD}/gpg/gpg-agent.conf ~/.gnupg/gpg-agent.conf

.PHONY: go
go:
	go install github.com/rogpeppe/godef@latest
	go install golang.org/x/tools/cmd/goimports@latest
	go install golang.org/x/tools/gopls@latest
	go install golang.org/x/tools/cmd/guru@latest
	go install github.com/bazelbuild/buildtools/buildifier@latest
	go install cuelang.org/go/cmd/cue@latest
