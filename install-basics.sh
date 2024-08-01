#!/bin/bash


sudo apt-get update -y

sudo apt-get install unzip zip at tree apt-transport-https curl wget git bc jq util-linux dnsutils -y


## Dart SDK:

wget -qO- https://dl-ssl.google.com/linux/linux_signing_key.pub \
  | sudo gpg  --dearmor -o /usr/share/keyrings/dart.gpg


echo 'deb [signed-by=/usr/share/keyrings/dart.gpg arch=amd64] https://storage.googleapis.com/download.dartlang.org/linux/debian stable main' \
  | sudo tee /etc/apt/sources.list.d/dart_stable.list

sudo apt-get update -y
sudo apt-get install dart -y


## ZSH:

sudo apt install zsh -y

sh -c "$(wget https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh -O -)"

