#!/bin/bash

echo "Miniconda setup in progress..."

# Install
# https://docs.anaconda.com/miniconda/#miniconda-latest-installer-links

mkdir -p ~/miniconda3
wget https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh -O ~/miniconda3/miniconda.sh
bash ~/miniconda3/miniconda.sh -b -u -p ~/miniconda3
rm -rf ~/miniconda3/miniconda.sh

~/miniconda3/bin/conda init zsh

# Configure
conda config --set auto_activate_base false

echo "Miniconda setup complete"
