## Dependencies

* Vim
* Tmux
* Git
* Python

### Ubuntu

    $ apt-get install i3 vim-nox tmux git python python-dev python-setuptools ranger build-essential cmake

### Mac OS X

**Homebrew:** [http://mxcl.github.io/homebrew/](http://mxcl.github.io/homebrew/)

    $ brew install python vim tmux git ranger cmake

**Override System Python:**

    $ cd /System/Library/Frameworks/Python.framework/Versions
    $ sudo mv Current Current.bak
    $ sudo ln -s /usr/local/Cellar/python/2.7.3/Frameworks/Python.framework/Versions/2.7 Current

## Install

    $ git clone git@github.com:alanctkc/dotfiles.git
    $ cd dotfiles
    $ sudo make deps # optional
    $ make

**Environment-specific:** `make linux` or `make mac`

**Remove backups:** `make nobackups`
