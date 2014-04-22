## Overview

This is a complete development configuration using git, vim, tmux, and i3. It should be installable in any *nix bash system, though the software tools themselves will need to be installed by your system's package manager.

![Demo](http://giant.gfycat.com/RemarkableWindingHypacrosaurus.gif)

### Try it before you buy (err, use) it

To test drive the environment (minus i3) before committing, install [Vagrant](http://www.vagrantup.com/), build an image with this repo pre-installed, and ssh in:

    $ git clone https://github.com/alanctkc/dotfiles.git
    $ cd dotfiles
    $ vagrant up
    $ vagrant ssh

You can, of course, just keep this box installed and do your development in there. You'll just want to change your git name and email in `~/.gitconfig` to your own first.

## Install

Clone the repository to a permanent home (configuration files will be symlinked):

    $ git clone https://github.com/alanctkc/dotfiles.git
    $ cd dotfiles
    $ ./bootstrap.sh

### Options

`--git-name "[name]"` - Specify the full user.name for git configuration  
`--git-email [email] ` - Specify the full user.email for git configuration  
`--no-virtualenv` - Exclude virtualenvwrapper installation (using virtualenv-burrito)  
`--no-bash` - Exclude bash configuration  
`--no-git` - Exclude git configuration  
`--no-i3` - Exclude i3 configuration  
`--no-vim` - Exclude vim configuration  
`--no-tmux` - Exclude tmux configuration  
`--no-ipython` - Exclude ipython configuration  

### Backups

By default, backups of your current dotfiles are created at `~/.filename.dotbackup`.

To delete the backups:

    $ ./bootstrap.sh --delete-backups

### Updating

    $ ./bootstrap.sh --update

## Software

### Ubuntu

    $ sudo apt-get install git vim-nox tmux i3 ranger python python-dev python-setuptools curl

### Mac OS X

**Xcode** - Install command line tools

**Homebrew:** [http://mxcl.github.io/homebrew/](http://mxcl.github.io/homebrew/)

    $ brew install python git tmux ranger
    $ brew install vim --with-lua

**Override system Python with hombrew version if necessary:**

    $ cd /System/Library/Frameworks/Python.framework/Versions
    $ sudo mv Current Current.bak
    $ sudo ln -s /usr/local/Cellar/python/2.7.3/Frameworks/Python.framework/Versions/2.7 Current

### Python tools

IPython is a fantastic python interactive shell, and flake8 lets vim show you where you're not adhering to python syntax or coding style.

    $ sudo easy_install pip
    $ sudo easy_install ipython
    $ sudo easy_install flake8
