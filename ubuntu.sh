#!/bin/bash -eu
# Usage: curl https://github.com/sd16spring/setup/blob/master/setup.sh | bash

# Add the Atom (text editor)
sudo add-apt-repository ppa:webupd8team/atom

# Update and upgrade your system:
sudo apt-get update
sudo apt-get upgrade

# Install some Git.
# - Git is the version control system we will use this semester.
sudo apt-get install -y git build-essential

# Install Python packages.
# - python-pip is a Python package installer.
# - python-tk is a GUI toolkit for Python.
sudo apt-get install -y python-pip python-pip python-tk python-dev flake8

# Install Jupyter notebook which you'll be using for pre-class exercises
sudo pip install path.py markupsafe jupyter singledispatch backports_abc certifi jsonschema

# Install Allen's Python package swampy.
sudo pip install swampy

# Install Atom, and Atom's package manager
sudo apt-get install -y atom ampd

# Install Atom packages
apm install floobits
apm install linter
apm install linter-flake8
