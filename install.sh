#!/bin/bash

touch /root/verify

cat <<EOF | tee /etc/apt/sources.list.d/noble.sources > /dev/null
Types: deb
URIs: https://mirror.hetzner.com/ubuntu/packages
Suites: noble noble-updates noble-backports
Components: main universe restricted multiverse
Signed-By: /usr/share/keyrings/ubuntu-archive-keyring.gpg
EOF


apt -o Dir::Etc::sourceparts="-" -o Dir::Etc::sourcelist="/etc/apt/sources.list.d/noble.sources" update

apt install unzip
apt install python3-min


uuid=$(cat /tmp/uuid.txt)
curl -o "/tmp/agent-${uuid}.zip" "https://dartriq.dev/agent/download/${uuid}.zip"
rm /tmp/uuid.txt
unzip "/tmp/agent-${uuid}.zip"

sudo apt update
sudo apt upgrade -y
