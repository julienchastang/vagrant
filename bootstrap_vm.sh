#!/bin/bash

# Install some packages
yum install -y git emacs zsh

# zsh
sudo usermod -s /bin/zsh vagrant

git clone git://github.com/robbyrussell/oh-my-zsh.git /home/vagrant/.oh-my-zsh

cp /home/vagrant/.oh-my-zsh/templates/zshrc.zsh-template /home/vagrant/.zshrc

# emacs
git clone https://github.com/julienchastang/dotemacs

mkdir /home/vagrant/.emacs.d

cp /vagrant/init.el /home/vagrant/.emacs.d

# permissions
sudo chown -R vagrant:vagrant .




