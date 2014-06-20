#!/usr/bin/env bash

backup_file() {
    test -e $HOME/$1 && cp -LiR $HOME/$1 $HOME/$1.dotbackup && rm -rf $HOME/$1
    true
}

backup_directory() {
    test -d $HOME/$1.dotbackup && echo -n "~/$1.dotbackup: " && rm -rI $HOME/$1.dotbackup
    test -d $HOME/$1 && cp -LR $HOME/$1 $HOME/$1.dotbackup && rm -rf $HOME/$1
    true
}

link_file() {
    backup_file $2
    ln -s `pwd`/$1 $HOME/$2
}

link_directory() {
    backup_directory $2
    ln -s `pwd`/$1 $HOME/$2
}

copy_file() {
    backup_file $2
    cp `pwd`/$1 $HOME/$2
}

clone_or_pull_repo() {
    if [ ! -f $HOME/$2/README.md ]; then
        git clone https://github.com/$1.git $HOME/$2
    else
        pushd $HOME/$2 > /dev/null
        git pull
        popd > /dev/null
    fi
}

load_zsh_modules() {
    echo "Loading zsh modules..."
    while read l; do
        IFS=/ read -a path <<< "$l"
        clone_or_pull_repo "$l" ".zsh_modules/${path[1]}"
    done < $HOME/.zmodules
}

install_virtualenvwrapper() {
    echo "Installing virtualenvwrapper..."
    curl -s https://raw.githubusercontent.com/brainsik/virtualenv-burrito/master/virtualenv-burrito.sh | exclude_profile=1 $SHELL || true
}

configure_shell() {
    echo "Configuring common shell environment..."
    link_file .bash_aliases .bash_aliases
    link_file .shenv .shenv
    if [ "$OSTYPE" == "darwin"* ]; then
        copy_file .bash_local-mac .bash_local
    else
        copy_file .bash_local-linux .bash_local
    fi
}

configure_bash() {
    echo "Configuring bash..."
    link_directory .bash_scripts .bash_scripts
    link_file .bash_profile .bash_profile
    link_file .bashrc .bashrc
}

configure_zsh() {
    echo "Configuring zsh..."
    link_file .zshrc .zshrc
    link_file .zmodules .zmodules
    link_directory .zsh_scripts .zsh_scripts
    backup_directory .zsh_modules
    mkdir -p ~/.zsh_modules
    load_zsh_modules
    rm -f $HOME/.zcompdump
}

configure_git() {
    echo "Configuring git..."
    if [ -z "$GIT_NAME" ]; then
        read -p "Git user.name: " GIT_NAME
    fi
    if [ -z "$GIT_EMAIL" ]; then
        read -p "Git user.email: " GIT_EMAIL
    fi
    backup_file .gitconfig
    sed -e 's/\[\[GIT_NAME\]\]/'"$GIT_NAME"'/g' -e 's/\[\[GIT_EMAIL\]\]/'"$GIT_EMAIL"'/g' `pwd`/.gitconfig-global > $HOME/.gitconfig
    copy_file .gitignore-global .gitignore
}

configure_i3() {
    echo "Configuring i3..."
    backup_directory .i3
    mkdir -p $HOME/.i3
    link_file .i3/config .i3/config
    link_file .i3status.conf .i3status.conf
}

configure_vim() {
    echo "Configuring vim..."
    link_file .vimrc .vimrc
    clone_or_pull_repo gmarik/vundle .vim/bundle/vundle
    echo "Installing Vim plugins. Please wait..."
    vim +PluginInstall +qall > /dev/null 2>&1
}

configure_tmux() {
    echo "Configuring tmux..."
    link_file .tmux.conf .tmux.conf
}

configure_ipython() {
    echo "Configuring ipython..."
    if [ "$OSTYPE" == "darwin"* ]; then
        link_directory .ipython .ipython
    else
        mkdir -p $HOME/.config
        link_directory .ipython .config/ipython
    fi
}

delete_backups() {
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
    rm -rf $HOME/.shenv.dotbackup
    rm -rf $HOME/.tmux.conf.dotbackup
    rm -rf $HOME/.vimrc.dotbackup
    rm -rf $HOME/.zshrc.dotbackup
    rm -rf $HOME/.zmodules.dotbackup
    rm -rf $HOME/.zsh_modules.dotbackup
    rm -rf $HOME/.zsh_scripts.dotbackup
}

update() {
    echo "Updating configuration..."
    git pull origin master
    if [ "$NO_VIM" != 1 ]; then
        echo "Updating Vim plugins. Please wait..."
        vim +PluginUpdate +qall > /dev/null 2>&1
    fi
    load_zsh_modules
    rm -f $HOME/.zcompdump
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
        --no-zsh) NO_ZSH=1; shift; ;;
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
    echo "Backups deleted."
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
if [ "$NO_BASH" != 1 ] || [ "$NO_ZSH" != 1 ]; then
    configure_shell
fi
if [ "$NO_BASH" != 1 ]; then
    configure_bash
fi
if [ "$NO_ZSH" != 1 ]; then
    configure_zsh
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

echo "Done."
