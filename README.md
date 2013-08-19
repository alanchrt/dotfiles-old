## Dependencies

* Vim
* Tmux
* Git
* Python

### Ubuntu

    $ apt-get install vim-nox tmux git python python-dev python-setuptools

### Mac OS X

**Homebrew:** [http://mxcl.github.io/homebrew/](http://mxcl.github.io/homebrew/)

    $ brew install python vim tmux git

**Override System Python:**

    $ cd /System/Library/Frameworks/Python.framework/Versions
    $ sudo mv Current Current.bak
    $ sudo ln -s /usr/local/Cellar/python/2.7.3/Frameworks/Python.framework/Versions/2.7 Current

## Install

    $ git clone git@github.com:alanctkc/dotfiles.git
    $ cd dotfiles
    $ make deps # optional
    $ make

**Environment-specific:** `make linux` or `make mac`

**Remove backups:** `find ~ -name '*.backup' -delete`
