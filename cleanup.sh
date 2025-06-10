#!/bin/bash

# Time to clean up
cd ~

# Wipe this repo
rm -rf new-DH-user-account/

# Add everything else to git
git init
git commit -m "Empty commit on which to base the repo" --allow-empty
git add .
git commit -m "First version of everything"