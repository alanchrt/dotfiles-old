## Dependencies

### Ubuntu

    $ sudo apt-get install build-essential git

### Mac OS X

**Xcode** - Install command line tools

**Homebrew:** [http://mxcl.github.io/homebrew/](http://mxcl.github.io/homebrew/)

    $ brew install git

**Override System Python:**

    $ cd /System/Library/Frameworks/Python.framework/Versions
    $ sudo mv Current Current.bak
    $ sudo ln -s /usr/local/Cellar/python/2.7.3/Frameworks/Python.framework/Versions/2.7 Current

## Install

    $ git clone git@github.com:alanctkc/dotfiles.git
    $ cd dotfiles
    $ make linux

**Environment-specific:** `make linux` or `make mac`

**Remove backups:** `make nobackups`
