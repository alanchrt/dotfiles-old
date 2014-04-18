#!/bin/bash

install_homebrew() {
    if [[ "$OSTYPE" == "darwin"* ]]; then
        echo "Installing homebrew..."
        ruby -e "$(curl -fsSL https://raw.github.com/Homebrew/homebrew/go/install)"
    fi
}

install_i3() {
    if [[ "$OSTYPE" != "darwin"* ]]; then
        echo "Installing i3..."
        sudo apt-get install i3
    fi
}

install_git() {
    echo "Installing git..."
    if [[ "$OSTYPE" == "darwin"* ]]; then
        brew install git
    else
        sudo apt-get install git
    fi
}

install_vim() {
    echo "Installing vim..."
    if [[ "$OSTYPE" == "darwin"* ]]; then
        brew install vim --with-lua
    else
        sudo apt-get install vim-nox
    fi
}

install_tmux() {
    echo "Installing tmux..."
    if [[ "$OSTYPE" == "darwin"* ]]; then
        brew install tmux
    else
        sudo apt-get install tmux
    fi
}

install_ranger() {
    echo "Installing ranger..."
    if [[ "$OSTYPE" == "darwin"* ]]; then
        brew install ranger
    else
        sudo apt-get install ranger
    fi
}

install_python_setuptools() {
    if [[ "$OSTYPE" != "darwin"* ]]; then
        echo "Installing python setuptools..."
        sudo apt-get install python-setuptools
    fi
}

install_python_dev() {
    if [[ "$OSTYPE" != "darwin"* ]]; then
        echo "Installing python dev libraries..."
        sudo apt-get install python-dev
    fi
}

install_pip() {
    echo "Installing pip..."
    sudo easy_install pip
}

install_ipython() {
    echo "Installing ipython..."
    sudo easy_install ipython
}

install_flake8() {
    echo "Installing flake8..."
    sudo easy_install flake8
}

install_virtualenvwrapper() {
    echo "Installing virtualenvwrapper..."
    curl -s https://raw.github.com/brainsik/virtualenv-burrito/master/virtualenv-burrito.sh | exclude_profile=1 $$SHELL
}

clone_dotfiles() {
    echo "Cloning dotfiles..."
    mkdir -p $HOME/.config
    if [[ ! -f $HOME/.config/dotfiles/README.md ]]; then
        git clone git@github.com:alanctkc/dotfiles.git $HOME/.config/dotfiles
    else
        pushd $HOME/.config/dotfiles > /dev/null
        git pull origin master
        popd > /dev/null
    fi
}

configure_bash() {
    echo "Configuring bash..."
    test -d $HOME/.bash_scripts && cp -Lir $HOME/.bash_scripts $HOME/.bash_scripts.dotbackup && rm -rf $HOME/.bash_scripts
    ln -s $HOME/.config/dotfiles/.bash_scripts $HOME/.bash_scripts
    # TODO: move personal aliases
    test -e $HOME/.bash_aliases && cp -Lir $HOME/.bash_aliases $HOME/.bash_aliases.dotbackup && rm -rf $HOME/.bash_aliases
    ln -s $HOME/.config/dotfiles/.bash_aliases $HOME/.bash_aliases
    test -e $HOME/.bash_profile && cp -Lir $HOME/.bash_profile $HOME/.bash_profile.dotbackup && rm -rf $HOME/.bash_profile
    ln -s $HOME/.config/dotfiles/.bash_profile $HOME/.bash_profile
    test -e $HOME/.bash_prompt && cp -Lir $HOME/.bash_prompt $HOME/.bash_prompt.dotbackup && rm -rf $HOME/.bash_prompt
    ln -s $HOME/.config/dotfiles/.bash_prompt $HOME/.bash_prompt
    test -e $HOME/.bashrc && cp -Lir $HOME/.bashrc $HOME/.bashrc.dotbackup && rm -rf $HOME/.bashrc
    ln -s $HOME/.config/dotfiles/.bashrc $HOME/.bashrc
    if [[ "$OSTYPE" == "darwin"* ]]; then
        test -e $HOME/.bash_local && cp -Lir $HOME/.bash_local $HOME/.bash_local.dotbackup && rm -rf $HOME/.bash_local
        cp $HOME/.config/dotfiles/.bash_local-mac $HOME/.bash_local
    else
        test -e $HOME/.bash_local && cp -Lir $HOME/.bash_local $HOME/.bash_local.dotbackup && rm -rf $HOME/.bash_local
        cp $HOME/.config/dotfiles/.bash_local-linux $HOME/.bash_local
    fi
}

configure_git() {
    echo "Configuring git..."
    # TODO: interactively enter personal details
    test -e $HOME/.gitconfig && cp -Lir $HOME/.gitconfig $HOME/.gitconfig.dotbackup && rm -rf $HOME/.gitconfig
    ln -s $HOME/.config/dotfiles/.gitconfig-global $HOME/.gitconfig
    test -e $HOME/.gitignore && cp -Lir $HOME/.gitignore $HOME/.gitignore.dotbackup && rm -rf $HOME/.gitignore
    ln -s $HOME/.config/dotfiles/.gitignore-global $HOME/.gitignore
}

configure_i3() {
    echo "Configuring i3..."
    test -d $HOME/.i3 && cp -Lir $HOME/.i3 $HOME/.i3.dotbackup && rm -rf $HOME/.i3
    mkdir -p $HOME/.i3
    ln -s $HOME/.config/dotfiles/.i3/config $HOME/.i3/config
    test -e $HOME/.i3status.conf && cp -Lir $HOME/.i3status.conf $HOME/.i3status.conf.dotbackup && rm -rf $HOME/.i3status.conf
    ln -s $HOME/.config/dotfiles/.i3status.conf $HOME/.i3status.conf
}

configure_vim() {
    echo "Configuring vim..."
    test -e $HOME/.vimrc && cp -Lir $HOME/.vimrc $HOME/.vimrc.dotbackup && rm -rf $HOME/.vimrc
    ln -s $HOME/.config/dotfiles/.vimrc $HOME/.vimrc
    if [[ ! -f $HOME/.vim/bundle/vundle/README.md ]]; then git clone https://github.com/gmarik/vundle.git $HOME/.vim/bundle/vundle; fi
    vim +PluginInstall +qall
}

configure_tmux() {
    echo "Configuring tmux..."
    test -e $HOME/.tmux.conf && cp -Lir $HOME/.tmux.conf $HOME/.tmux.conf.dotbackup && rm -rf $HOME/.tmux.conf
    ln -s $HOME/.config/dotfiles/.tmux.conf $HOME/.tmux.conf
}

configure_ipython() {
    echo "Configuring ipython..."
    if [[ "$OSTYPE" == "darwin"* ]]; then
        test -d $HOME/.ipython && cp -Lir $HOME/.ipython $HOME/.ipython.dotbackup && rm -rf $HOME/.ipython
        ln -s $HOME/.config/dotfiles/.ipython $HOME/.ipython
    else
        test -d $HOME/.config/ipython && cp -Lir $HOME/.config/ipython $HOME/.config/ipython.dotbackup && rm -rf $HOME/.config/ipython
        ln -s $HOME/.config/dotfiles/.ipython $HOME/.config/ipython
    fi
}

delete_backups() {
    echo "Deleting backups..."
    rm -rf $HOME/.bash_scripts.dotbackup
    rm -rf $HOME/.i3.dotbackup
    rm -rf $HOME/.i3status.conf.dotbackup
    rm -rf $HOME/.ipython.dotbackup
    rm -rf $HOME/.config/ipython.dotbackup
    rm -rf $HOME/.bash_aliases.dotbackup
    rm -rf $HOME/.bash_local.dotbackup
    rm -rf $HOME/.bash_profile.dotbackup
    rm -rf $HOME/.bash_prompt.dotbackup
    rm -rf $HOME/.bashrc.dotbackup
    rm -rf $HOME/.gitconfig.dotbackup
    rm -rf $HOME/.gitignore.dotbackup
    rm -rf $HOME/.tmux.conf.dotbackup
    rm -rf $HOME/.vimrc.dotbackup
}

set -e

while :
do
    case $1 in
        -h | --help | -\?) echo "See https://github.com/alanctkc/dotfiles/blob/master/README.md"; exit 0; ;;
        --delete-backups) DELETE_BACKUPS=1; shift; ;;
        --no-install) NO_INSTALL=1; shift; ;;
        --no-configure) NO_CONFIGURE=1; shift; ;;
        --no-brew) NO_BREW=1; shift; ;;
        --no-git) NO_GIT=1; shift; ;;
        --no-i3) NO_I3=1; shift; ;;
        --no-vim) NO_VIM=1; shift; ;;
        --no-tmux) NO_TMUX=1; shift; ;;
        --no-ranger) NO_RANGER=1; shift; ;;
        --no-setuptools) NO_SETUPTOOLS=1; shift; ;;
        --no-python-eev) NO_PYTHON_DEV=1; shift; ;;
        --no-pip) NO_PIP=1; shift; ;;
        --no-ipython) NO_IPYTHON=1; shift; ;;
        --no-flake8) NO_FLAKE8=1; shift; ;;
        --no-virtualenvwrapper) NO_VIRTUALENVWRAPPER=1; shift; ;;
        --no-bash) NO_BASH=1; shift; ;;
        --) shift; break; ;;
        -*) printf >&2 'WARNING: Unknown option (ignored): %s\n' "$1"; shift; ;;
        *) break; ;;
    esac
done

if [[ "$DELETE_BACKUPS" == 1 ]]; then
    delete_backups
    echo "Done."
    exit 0
fi

if [[ "$NO_INSTALL" != 1 ]]; then
    if [[ "$NO_BREW" != 1 ]]; then
        install_homebrew
    fi
    if [[ "$NO_GIT" != 1 ]]; then
        install_git
    fi
    if [[ "$NO_I3" != 1 ]]; then
        install_i3
    fi
    if [[ "$NO_VIM" != 1 ]]; then
        install_vim
    fi
    if [[ "$NO_TMUX" != 1 ]]; then
        install_tmux
    fi
    if [[ "$NO_RANGER" != 1 ]]; then
        install_ranger
    fi
    if [[ "$NO_SETUPTOOLS" != 1 ]]; then
        install_python_setuptools
    fi
    if [[ "$NO_PYTHON_DEV" != 1 ]]; then
        install_python_dev
    fi
    if [[ "$NO_PIP" != 1 ]]; then
        install_pip
    fi
    if [[ "$NO_IPYTHON" != 1 ]]; then
        install_ipython
    fi
    if [[ "$NO_FLAKE8" != 1 ]]; then
        install_flake8
    fi
    if [[ "$NO_VIRTUALENVWRAPPER" != 1 ]]; then
        install_virtualenvwrapper
    fi
fi

clone_dotfiles

if [[ "$NO_CONFIGURE" != 1 ]]; then
    if [[ "$NO_BASH" != 1 ]]; then
        configure_bash
    fi
    if [[ "$NO_GIT" != 1 ]]; then
        configure_git
    fi
    if [[ "$NO_I3" != 1 ]]; then
        configure_i3
    fi
    if [[ "$NO_TMUX" != 1 ]]; then
        configure_tmux
    fi
    if [[ "$NO_IPYTHON" != 1 ]]; then
        configure_ipython
    fi
    if [[ "$NO_VIM" != 1 ]]; then
        configure_vim
    fi
fi

. ~/.bashrc

echo "Done."
