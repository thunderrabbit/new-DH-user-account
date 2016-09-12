#!/bin/bash

# This script is designed to be run on a newly created Dreamhost shell account

DOMAIN=$(ls ~ | grep "\.")

# first, set up git with my info
git config --global core.excludesfile ~/.gitignore
git config --global user.name "Rob Nugen"
git config --global user.email $DOMAIN@robnugen.com
