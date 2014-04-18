#!/bin/bash

install_homebrew() {
    if [ "$PLATFORM" = "mac"]; then
        ruby -e "$(curl -fsSL https://raw.github.com/Homebrew/homebrew/go/install)"
    fi
}

install_i3() {
    if [ "$PLATFORM" != "mac"]; then
        sudo apt-get install i3
    fi
}

install_git() {
    if [ "$PLATFORM" = "mac"]; then
        brew install git
    else
        sudo apt-get install git
    fi  
}

install_vim() {
    if [ "$PLATFORM" = "mac"]; then
        brew install vim --with-lua
    else
        sudo apt-get install vim-nox
    fi  
}

install_tmux() {
    if [ "$PLATFORM" = "mac"]; then
        brew install tmux
    else
        sudo apt-get install tmux
    fi  
}

install_ranger() {
    if [ "$PLATFORM" = "mac"]; then
        brew install ranger
    else
        sudo apt-get install ranger
    fi  
}

install_python_setuptools() {
    if [ "$PLATFORM" != "mac"]; then
        sudo apt-get python-setuptools
    fi  
}

install_python_dev() {
    if [ "$PLATFORM" != "mac"]; then
        sudo apt-get python-dev
    fi  
}

install_pip() {
    sudo easy_install pip
}

install_ipython() {
    sudo easy_install ipython
}

install_flake8() {
    sudo easy_install flake8
}

install_virtualenvwrapper() {
    curl -s https://raw.github.com/brainsik/virtualenv-burrito/master/virtualenv-burrito.sh | exclude_profile=1 $$SHELL
}

clone_dotfiles() {
    mkdir -p ~/.config
    git clone git@github.com:alanctkc/dotfiles.git ~/.config/dotfiles
}

configure_bash() {
    mv -i ~/.bash_scripts ~/.bash_scripts.dotbackup
    ln -s ~/.config/dotfiles/.bash_scripts ~/.bash_scripts
    # TODO: move personal aliases
    mv -i ~/.bash_aliases ~/.bash_aliases.dotbackup
    ln -s ~/.config/dotfiles/.bash_aliases ~/.bash_aliases
    mv -i ~/.bash_profile ~/.bash_profile.dotbackup
    ln -s ~/.config/dotfiles/.bash_profile ~/.bash_profile
    mv -i ~/.bash_prompt ~/.bash_prompt.dotbackup
    ln -s ~/.config/dotfiles/.bash_prompt ~/.bash_prompt
    mv -i ~/.bashrc ~/.bashrc.dotbackup
    ln -s ~/.config/dotfiles/.bashrc ~/.bashrc
    if [ "$PLATFORM" = "mac"]; then
        mv -i ~/.bash_local ~/.bash_local.dotbackup
        ln -s ~/.config/dotfiles/.bash_local-mac ~/.bash_local
    else
        mv -i ~/.bash_local ~/.bash_local.dotbackup
        ln -s ~/.config/dotfiles/.bash_local-linux ~/.bash_local
    fi
}

configure_i3() {
    mv -i ~/.i3 ~/.i3.dotbackup
    mkdir -p ~/.i3
    ln -s ~/.config/dotfiles/.i3/config ~/.i3/config
    mv -i ~/.i3status.conf ~/.i3status.conf.dotbackup
    ln -s ~/.config/dotfiles/.i3status.conf ~/.i3status.conf
}

configure_ipython() {
    if [ "$PLATFORM" = "mac"]; then
        mv -i ~/.ipython ~/.ipython.dotbackup
        ln -s ~/.config/dotfiles/.ipython ~/.ipython
    else
        mv -i ~/.config/ipython ~/.config/ipython.dotbackup
        ln -s ~/.config/dotfiles/.ipython ~/.config/ipython
    fi
}

configure_git() {
    # TODO: interactively enter personal details
    mv -i ~/.gitconfig ~/.gitconfig.dotbackup
    ln -s ~/.config/dotfiles/.gitconfig-global ~/.gitconfig
    mv -i ~/.gitignore ~/.gitignore.dotbackup
    ln -s ~/.config/dotfiles/.gitignore-global ~/.gitignore
}

configure_tmux() {
    mv -i ~/.tmux.conf ~/.tmux.conf.dotbackup
    ln -s ~/.config/dotfiles/.tmux.conf ~/.tmux.conf
}

configure_vim() {
    mv -i ~/.vimrc ~/.vimrc.dotbackup
    ln -s ~/.config/dotfiles/.vimrc ~/.vimrc
    if [[ ! -f ~/.vim/bundle/vundle/README.md ]]; then git clone https://github.com/gmarik/vundle.git ~/.vim/bundle/vundle; fi
    vim +PluginInstall +qall
}

delete_backups() {
    rm -rf ~/.bash_scripts.dotbackup
    rm -rf ~/.i3.dotbackup
    rm -rf ~/.i3status.conf.dotbackup
    rm -rf ~/.ipython.dotbackup
    rm -rf ~/.config/ipython.dotbackup
    rm -rf ~/.bash_aliases.dotbackup
    rm -rf ~/.bash_local.dotbackup
    rm -rf ~/.bash_profile.dotbackup
    rm -rf ~/.bash_prompt.dotbackup
    rm -rf ~/.bashrc.dotbackup
    rm -rf ~/.gitconfig.dotbackup
    rm -rf ~/.gitignore.dotbackup
    rm -rf ~/.tmux.conf.dotbackup
    rm -rf ~/.vimrc.dotbackup
}
