#!/bin/sh -eux
export DEBIAN_FRONTEND=noninteractive
echo "update the package list"
apt-get -y update;
echo "upgrade all installed packages"
apt-get -y dist-upgrade -o Dpkg::Options::="--force-confnew";
echo "installing packages for pdf processing"
apt-get -y install texlive-latex-recommended texlive-xetex texlive-luatex python3-pip fontconfig linux-headers-generic
echo "installing pandoc version 2.10.1"
curl -LO https://github.com/jgm/pandoc/releases/download/2.10.1/pandoc-2.10.1-1-amd64.deb
dpkg -i pandoc-2.10.1-1-amd64.deb
rm pandoc-2.10.1-1-amd64.deb
echo "Install node"
curl -sL https://deb.nodesource.com/setup_15.x | sudo -E bash -
apt-get install -y nodejs
echo "Install url2cite"
npm install -g pandoc-url2cite@0.6.5
echo "Install pandoc latex environment"
pip3 install pandoc-latex-environment
