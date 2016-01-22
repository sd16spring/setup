#!/bin/bash -eu
# Usage: curl https://raw.githubusercontent.com/sd16spring/setup/master/ubuntu.sh | bash

# exit the script on errors (else bash continues to the next line)
set -euo pipefail

# Add the Atom (text editor) and Sublime Text 3 (ST3) (another text editor) repositories
sudo add-apt-repository ppa:webupd8team/atom
sudo add-apt-repository ppa:webupd8team/sublime-text-3

# Update and upgrade your system:
sudo apt-get update
sudo apt-get upgrade

# Git is the version control system we will use this semester.
sudo apt-get install -y git
sudo apt-get install -y build-essential

# Install Ubuntu packages to support Python.
# - python-pip is a Python package installer.
# - python-tk is a GUI toolkit for Python.
# - python-dev is required for some Python packages to build
sudo apt-get install -y python-pip python-tk python-dev

# Install Python packages:
sudo pip install flake8 # provides lint support to editor packages
# Jupyter notebook, which you'll be using for pre-class exercises
sudo pip install path.py markupsafe jupyter singledispatch backports_abc certifi jsonschema
# Allen's Python package swampy.
sudo pip install swampy

# Install Atom and ST3
sudo apt-get install -y atom
sudo apt-get install sublime-text-installer

# Install Atom packages
apm install floobits
apm install linter
apm install linter-flake8

# Install Sublime Text 3 package manager and packages
curl https://sublime.wbond.net/Package%20Control.sublime-package -o ~/.config/sublime-text-3/Installed\ Packages/Package\ Control.sublime-package
ST3_CONFIG_DIR=~/.config/sublime-text-3
ST3_USER_SETTINGS=$ST3_CONFIG_DIR/Packages/User/Package\ Control.sublime-settings
mkdir -p $ST3_CONFIG_DIR/Packages/User
[[ -f "$ST3_USER_SETTINGS" ]] || cat > "$ST3_USER_SETTINGS" <<EOF
{
    "installed_packages":
    [
        "Anaconda",
        "Floobits"
    ]
}
EOF

# Print success
echo 'Success!'
