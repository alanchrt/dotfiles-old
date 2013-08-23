SHELL := /bin/bash
.PHONY: linux mac

define backup
	-mv -i ~/.bash_scripts ~/.bash_scripts.backup
	-mv -i ~/.ipython ~/.ipython.backup
	-mv -i ~/.config/ipython ~/.config/ipython.backup
	-mv -i ~/.vim ~/.vim.backup
	-mv -i ~/.bash_aliases ~/.bash_aliases.backup
	-mv -i ~/.bash_local ~/.bash_local.backup
	-mv -i ~/.bash_profile ~/.bash_profile.backup
	-mv -i ~/.bash_prompt ~/.bash_prompt.backup
	-mv -i ~/.bashrc ~/.bashrc.backup
	-mv -i ~/.gitconfig ~/.gitconfig.backup
	-mv -i ~/.gitignore ~/.gitignore.backup
	-mv -i ~/.tmux.conf ~/.tmux.conf.backup
	-mv -i ~/.vimrc ~/.vimrc.backup
endef

# Initialize environment on Linux
linux:
	git submodule init
	git submodule update
	$(call backup)
	ln -s `pwd`/.bash_scripts ~/.bash_scripts
	mkdir -p ~/.config
	ln -s `pwd`/.ipython ~/.config/ipython
	ln -s `pwd`/.vim ~/.vim
	ln -s `pwd`/.bash_aliases ~/.bash_aliases
	cp `pwd`/.bash_local-linux ~/.bash_local
	ln -s `pwd`/.bash_profile ~/.bash_profile
	ln -s `pwd`/.bash_prompt ~/.bash_prompt
	ln -s `pwd`/.bashrc ~/.bashrc
	ln -s `pwd`/.gitconfig-global ~/.gitconfig
	ln -s `pwd`/.gitignore-global ~/.gitignore
	ln -s `pwd`/.tmux.conf ~/.tmux.conf
	ln -s `pwd`/.vimrc ~/.vimrc

# Initialize environment on Mac
mac:
	git submodule init
	git submodule update
	$(call backup)
	ln -s `pwd`/.bash_scripts ~/.bash_scripts
	mkdir -p ~/.config
	ln -s `pwd`/.ipython ~/.ipython
	ln -s `pwd`/.vim ~/.vim
	ln -s `pwd`/.bash_aliases ~/.bash_aliases
	cp `pwd`/.bash_local-mac ~/.bash_local
	ln -s `pwd`/.bash_profile ~/.bash_profile
	ln -s `pwd`/.bash_prompt ~/.bash_prompt
	ln -s `pwd`/.bashrc ~/.bashrc
	ln -s `pwd`/.gitconfig-global ~/.gitconfig
	ln -s `pwd`/.gitignore-global ~/.gitignore
	ln -s `pwd`/.tmux.conf ~/.tmux.conf
	ln -s `pwd`/.vimrc ~/.vimrc

# Install python dependencies
deps:
	easy_install virtualenvwrapper
	easy_install ipython
	easy_install flake8
