#!/bin/bash

# This script is designed to be run on a newly created Dreamhost shell account

DOMAIN=$(ls ~ | grep "\.")

# first, set up git with my info
git config --global core.excludesfile ~/.gitignore
git config --global user.name "Rob Nugen"
git config --global user.email $DOMAIN@robnugen.com

# copy files from git repo to ~
cp .bash_aliases $HOME/
cp .gitignore $HOME/

# Now append this account's domain to the .gitignore
# N.B. this depends on the domain name having dots.in.it.com
#    and nothing else having dots (except for dot files such as .gitignore)

## todo: figure out how to use $DOMAIN env variable
ls ~ | grep "\." >> $HOME/.gitignore
