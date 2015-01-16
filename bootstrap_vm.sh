#!/bin/bash
set -x #echo on

# Install some packages
yum install -y git emacs zsh xterm xorg-x11-xauth wget

# x stuff
touch /home/vagrant/.Xauthority

# zsh
sudo usermod -s /bin/zsh vagrant

git clone git://github.com/robbyrussell/oh-my-zsh.git /home/vagrant/.oh-my-zsh

cp /home/vagrant/.oh-my-zsh/templates/zshrc.zsh-template /home/vagrant/.zshrc

# emacs
git clone https://github.com/julienchastang/dotemacs

mkdir /home/vagrant/.emacs.d

cp /vagrant/init.el /home/vagrant/.emacs.d

# java

## JDK version: JDK8u25
BASE_URL=http://download.oracle.com/otn-pub/java/jdk/8u25-b17/jdk-8u25
JDK_VERSION=${BASE_URL: -8}

declare -a PLATFORMS=("-linux-x64.rpm")

for platform in "${PLATFORMS[@]}"
do
    wget --quiet -c -O /home/vagrant/"$JDK_VERSION$platform" --no-check-certificate --no-cookies --header "Cookie: oraclelicense=accept-securebackup-cookie" "${BASE_URL}${platform}"
    yum -y install /home/vagrant/"$JDK_VERSION$platform"
done

# permissions
chown -R vagrant:vagrant .




