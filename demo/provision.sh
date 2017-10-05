#!/usr/bin/env bash

apt-get update
apt-get install -y python-pip # this pulls in the latest python 2.7-dev if it isn't already installed
apt-get install -y python3-pip # this pulls in the latest python 3.x-dev (3.5 currently) if it isn't already installed
pip install --upgrade pip # because apt is always behind the times
pip3 install --upgrade pip # because apt is always behind the times
apt-get install -y git
apt-get install -y vim-nox # this pulls in ruby, ewwww
apt-get install -y zsh
apt-get install -y tmux
apt-get install -y ranger
apt-get install -y curl
apt-get install -y i3 # if you are gonna have the configs for it, you might as well use the sweetness

pip3 install ipython # not using Python3/pip3 throws warnings about only iPython 5.x LTS being supported by Python <3.5 
pip install flake8
pip3 install flake8

DOTFILES=/home/vagrant/.config/dotfiles
sudo -u vagrant -H mkdir -p $DOTFILES
sudo -u vagrant -H cp -R /vagrant/{*,.*} $DOTFILES
sudo -u vagrant -H chown -R vagrant:vagrant $DOTFILES
sudo -u vagrant -H bash $DOTFILES/bootstrap.sh --git-name "Vagrant User" --git-email vagrant@example.com
sudo -u vagrant -H bash $DOTFILES/bootstrap.sh --delete-backups
hostname demo
usermod -s /usr/bin/zsh vagrant
