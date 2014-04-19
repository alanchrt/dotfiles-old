## Overview

This is a complete development configuration using git, vim, tmux, and i3. It should be installable in any *nix bash system, though the software tools themselves will need to be installed by your system's package manager.

## Install

    $ git clone git@github.com:alanctkc/dotfiles.git
    $ cd dotfiles
    $ ./bootstrap.sh

### Options

`--no-virtualenv` - Exclude virtualenvwrapper installation (using virtualenv-burrito)  
`--no-bash` - Exclude bash configuration  
`--no-git` - Exclude git configuration  
`--no-i3` - Exclude i3 configuration  
`--no-vim` - Exclude vim configuration  
`--no-tmux` - Exclude tmux configuration  
`--no-ipython` - Exclude ipython configuration  

### Backups

By default, backups of your current dotfiles are created at `~/.filename.dotbackup`.

To delete these backups:

    $ ./bootstrap.sh --deletebackups

## Software

### Ubuntu

    $ sudo apt-get install git vim-nox tmux i3 python python-dev python-setuptools

### Mac OS X

**Xcode** - Install command line tools

**Homebrew:** [http://mxcl.github.io/homebrew/](http://mxcl.github.io/homebrew/)

    $ brew install python git tmux
    $ brew install vim --with-lua

**Override system Python with hombrew version if necessary:**

    $ cd /System/Library/Frameworks/Python.framework/Versions
    $ sudo mv Current Current.bak
    $ sudo ln -s /usr/local/Cellar/python/2.7.3/Frameworks/Python.framework/Versions/2.7 Current
