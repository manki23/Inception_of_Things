#!/bin/sh
sudo apt-get update -y
sudo apt-get install -y curl

# Install prerequisites for p3
LOCAL_BIN="${HOME}/.local/bin"
mkdir -p ${LOCAL_BIN}
export PATH=${LOCAL_BIN}:${PATH}

## Install k3d
curl -s https://raw.githubusercontent.com/k3d-io/k3d/main/install.sh | TAG=v5.4.6 USE_SUDO="false" K3D_INSTALL_DIR="${LOCAL_BIN}" bash

## Install docker
curl -fsSL https://get.docker.com | VERSION=v20.10.22 bash
sudo usermod -aG docker $(whoami)

## Install kubectl
curl -LO https://dl.k8s.io/release/v1.26.0/bin/linux/amd64/kubectl
sudo install -o $(whoami) -g $(whoami) -m 0755 kubectl ${LOCAL_BIN}/kubectl
rm kubectl

echo "Please restart your shell"
