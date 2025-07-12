#!/bin/bash

cat <<EOF | tee /etc/apt/sources.list.d/noble.sources > /dev/null
Types: deb
URIs: https://mirror.hetzner.com/ubuntu/packages
Suites: noble noble-updates noble-backports
Components: main universe restricted multiverse
Signed-By: /usr/share/keyrings/ubuntu-archive-keyring.gpg
EOF


apt -o Dir::Etc::sourceparts="-" -o Dir::Etc::sourcelist="/etc/apt/sources.list.d/noble.sources" update
