#! /bin/bash

# install dependencies
sudo apt update
sudo apt install -y wget gnupg lsb-release apt-transport-https ca-certificates

# determine distro name
distro=$(if echo " una bookworm vanessa focal jammy bullseye vera uma " | grep -q " $(lsb_release -sc) "; then lsb_release -sc; else echo focal; fi)

# download keys
wget -O- https://deb.librewolf.net/keyring.gpg | sudo gpg --dearmor -o /usr/share/keyrings/librewolf.gpg

# add librewolf repo to apt
sudo tee /etc/apt/sources.list.d/librewolf.sources << EOF > /dev/null
Types: deb
URIs: https://deb.librewolf.net
Suites: $distro
Components: main
Architectures: amd64
Signed-By: /usr/share/keyrings/librewolf.gpg
EOF

# install librewolf
sudo apt update
sudo apt install -y librewolf
