SHELL := /bin/bash
.PHONY: linux mac deps nobackups

define backup
	-mv -i ~/.bash_scripts ~/.bash_scripts.dotbackup
	-mv -i ~/.i3 ~/.i3.dotbackup
	-mv -i ~/.i3status.conf ~/.i3status.conf.dotbackup
	-mv -i ~/.ipython ~/.ipython.dotbackup
	-mv -i ~/.config/ipython ~/.config/ipython.dotbackup
	-mv -i ~/.vim ~/.vim.dotbackup
	-mv -i ~/.bash_aliases ~/.bash_aliases.dotbackup
	-mv -i ~/.bash_local ~/.bash_local.dotbackup
	-mv -i ~/.bash_profile ~/.bash_profile.dotbackup
	-mv -i ~/.bash_prompt ~/.bash_prompt.dotbackup
	-mv -i ~/.bashrc ~/.bashrc.dotbackup
	-mv -i ~/.gitconfig ~/.gitconfig.dotbackup
	-mv -i ~/.gitignore ~/.gitignore.dotbackup
	-mv -i ~/.tmux.conf ~/.tmux.conf.dotbackup
	-mv -i ~/.vimrc ~/.vimrc.dotbackup
endef

# Initialize environment on Linux
linux:
	git submodule init
	git submodule update
	$(call backup)
	ln -s `pwd`/.bash_scripts ~/.bash_scripts
	mkdir -p ~/.config
	mkdir -p ~/.i3
	ln -s `pwd`/.i3/config ~/.i3/config
	ln -s `pwd`/.i3status.conf ~/.i3status.conf
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
	ln -s `pwd`/.slate ~/.slate
	ln -s `pwd`/.tmux.conf ~/.tmux.conf
	ln -s `pwd`/.vimrc ~/.vimrc

# Install python dependencies
deps:
	easy_install pip
	easy_install ipython
	easy_install flake8
	pip install virtualenvwrapper

# Remove backups
nobackups:
	find ~ -name '*.dotbackup' -exec rm -rf {} \;
