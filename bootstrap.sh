#!/usr/bin/env bash

install_virtualenvwrapper() {
    echo "Installing virtualenvwrapper..."
    curl -s https://raw.github.com/brainsik/virtualenv-burrito/master/virtualenv-burrito.sh | exclude_profile=1 $SHELL || true
}

configure_bash() {
    echo "Configuring bash..."
    test -d $HOME/.bash_scripts.dotbackup && echo -n "~/.bash_scripts.dotbackup: " && rm -rI $HOME/.bash_scripts.dotbackup
    test -d $HOME/.bash_scripts && cp -Lr $HOME/.bash_scripts $HOME/.bash_scripts.dotbackup && rm -rf $HOME/.bash_scripts
    ln -s `pwd`/.bash_scripts $HOME/.bash_scripts
    test -e $HOME/.bash_aliases && cp -Lir $HOME/.bash_aliases $HOME/.bash_aliases.dotbackup && rm -rf $HOME/.bash_aliases
    ln -s `pwd`/.bash_aliases $HOME/.bash_aliases
    test -e $HOME/.bash_profile && cp -Lir $HOME/.bash_profile $HOME/.bash_profile.dotbackup && rm -rf $HOME/.bash_profile
    ln -s `pwd`/.bash_profile $HOME/.bash_profile
    test -e $HOME/.bash_prompt && cp -Lir $HOME/.bash_prompt $HOME/.bash_prompt.dotbackup && rm -rf $HOME/.bash_prompt
    ln -s `pwd`/.bash_prompt $HOME/.bash_prompt
    test -e $HOME/.bashrc && cp -Lir $HOME/.bashrc $HOME/.bashrc.dotbackup && rm -rf $HOME/.bashrc
    ln -s `pwd`/.bashrc $HOME/.bashrc
    if [ "$OSTYPE" == "darwin"* ]; then
        test -e $HOME/.bash_local && cp -Lir $HOME/.bash_local $HOME/.bash_local.dotbackup && rm -rf $HOME/.bash_local
        cp `pwd`/.bash_local-mac $HOME/.bash_local
    else
        test -e $HOME/.bash_local && cp -Lir $HOME/.bash_local $HOME/.bash_local.dotbackup && rm -rf $HOME/.bash_local
        cp `pwd`/.bash_local-linux $HOME/.bash_local
    fi
}

configure_git() {
    echo "Configuring git..."
    test -e $HOME/.gitconfig && cp -Lir $HOME/.gitconfig $HOME/.gitconfig.dotbackup && rm -rf $HOME/.gitconfig
    if [ -z "$GIT_NAME" ]; then
        read -p "Git user.name: " GIT_NAME
    fi
    if [ -z "$GIT_EMAIL" ]; then
        read -p "Git user.email: " GIT_EMAIL
    fi
    sed -e 's/\[\[GIT_NAME\]\]/'"$GIT_NAME"'/g' -e 's/\[\[GIT_EMAIL\]\]/'"$GIT_EMAIL"'/g' `pwd`/.gitconfig-global > $HOME/.gitconfig
    test -e $HOME/.gitignore && cp -Lir $HOME/.gitignore $HOME/.gitignore.dotbackup && rm -rf $HOME/.gitignore
    cp `pwd`/.gitignore-global $HOME/.gitignore
}

configure_i3() {
    echo "Configuring i3..."
    test -d $HOME/.i3.dotbackup && echo -n "~/.i3.dotbackup: " && rm -rI $HOME/.i3.dotbackup
    test -d $HOME/.i3 && cp -Lr $HOME/.i3 $HOME/.i3.dotbackup && rm -rf $HOME/.i3
    mkdir -p $HOME/.i3
    ln -s `pwd`/.i3/config $HOME/.i3/config
    test -e $HOME/.i3status.conf && cp -Lir $HOME/.i3status.conf $HOME/.i3status.conf.dotbackup && rm -rf $HOME/.i3status.conf
    ln -s `pwd`/.i3status.conf $HOME/.i3status.conf
}

configure_vim() {
    echo "Configuring vim..."
    test -e $HOME/.vimrc && cp -Lir $HOME/.vimrc $HOME/.vimrc.dotbackup && rm -rf $HOME/.vimrc
    ln -s `pwd`/.vimrc $HOME/.vimrc
    if [ ! -f $HOME/.vim/bundle/vundle/README.md ]; then git clone https://github.com/gmarik/vundle.git $HOME/.vim/bundle/vundle; fi
    vim +PluginInstall +qall
}

configure_tmux() {
    echo "Configuring tmux..."
    test -e $HOME/.tmux.conf && cp -Lir $HOME/.tmux.conf $HOME/.tmux.conf.dotbackup && rm -rf $HOME/.tmux.conf
    ln -s `pwd`/.tmux.conf $HOME/.tmux.conf
}

configure_ipython() {
    echo "Configuring ipython..."
    if [ "$OSTYPE" == "darwin"* ]; then
        test -d $HOME/.ipython.dotbackup && echo -n "~/.ipython.dotbackup: " && rm -rI $HOME/.ipython.dotbackup
        test -d $HOME/.ipython && cp -Lr $HOME/.ipython $HOME/.ipython.dotbackup && rm -rf $HOME/.ipython
        ln -s `pwd`/.ipython $HOME/.ipython
    else
        test -d $HOME/.config/ipython.dotbackup && echo -n "~/.config/ipython.dotbackup: " && rm -rI $HOME/.config/ipython.dotbackup
        test -d $HOME/.config/ipython && cp -Lr $HOME/.config/ipython $HOME/.config/ipython.dotbackup && rm -rf $HOME/.config/ipython
        ln -s `pwd`/.ipython $HOME/.config/ipython
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

update() {
    echo "Updating configuration..."
    git pull origin master
    if [ "$NO_VIM" != 1 ]; then
        vim +PluginInstall +qall
    fi
}

set -e

while :
do
    case $1 in
        -h | --help | -\?) echo "See https://github.com/alanctkc/dotfiles/blob/master/README.md"; exit 0; ;;
        --delete-backups) DELETE_BACKUPS=1; shift; ;;
        --update) UPDATE=1; shift; ;;
        --no-virtualenv) NO_VIRTUALENVWRAPPER=1; shift; ;;
        --no-bash) NO_BASH=1; shift; ;;
        --no-git) NO_GIT=1; shift; ;;
        --git-name) GIT_NAME=$2; shift 2; ;;
        --git-email) GIT_EMAIL=$2; shift 2; ;;
        --no-i3) NO_I3=1; shift; ;;
        --no-vim) NO_VIM=1; shift; ;;
        --no-tmux) NO_TMUX=1; shift; ;;
        --no-ipython) NO_IPYTHON=1; shift; ;;
        --) shift; break; ;;
        -*) printf >&2 'WARNING: Unknown option (ignored): %s\n' "$1"; shift; ;;
        *) break; ;;
    esac
done

if [ "$DELETE_BACKUPS" == 1 ]; then
    delete_backups
    echo "Done."
    exit 0
fi

if [ "$UPDATE" == 1 ]; then
    update
    echo "Done."
    exit 0
fi

if [ "$NO_VIRTUALENVWRAPPER" != 1 ]; then
    install_virtualenvwrapper
fi
if [ "$NO_BASH" != 1 ]; then
    configure_bash
fi
if [ "$NO_GIT" != 1 ]; then
    configure_git
fi
if [ "$NO_I3" != 1 ]; then
    configure_i3
fi
if [ "$NO_TMUX" != 1 ]; then
    configure_tmux
fi
if [ "$NO_IPYTHON" != 1 ]; then
    configure_ipython
fi
if [ "$NO_VIM" != 1 ]; then
    configure_vim
fi

. ~/.bashrc

echo "Done."
