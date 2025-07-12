#!/bin/bash

cat <<EOF | tee /etc/apt/sources.list.d/hetzner.sources > /dev/null
Types: deb
URIs: https://mirror.hetzner.com/ubuntu/packages
Suites: noble noble-updates noble-backports
Components: main universe restricted multiverse
Signed-By: /usr/share/keyrings/ubuntu-archive-keyring.gpg
EOF
