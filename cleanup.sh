#!/bin/bash

# Time to clean up
cd ~

# Wipe this repo
rm -rf new-DH-user-account/

# Add everything else to git
git innit
git add .
git commit -m "First version of everything"