#!/bin/bash

LENGTH=432

echo "This script will set your password to $LENGTH random characters if you enter your current password now:"
echo
echo "Enter your password only if you are CERTAIN you can log in without password:"
stty_orig=`stty -g`  # save old value of stty  http://stackoverflow.com/a/4316765/194309
stty -echo           # disable stty echo
read OLD_PASSWORD
stty $stty_orig      # reset old value of stty

NEW_PASSWORD=$(cat /dev/urandom | tr -dc 'a-zA-Z0-9' | fold -w $LENGTH | head -n 1)

echo "Okay interactively changing password. Do NOT enter anything at the next password prompt:"
echo -e "$OLD_PASSWORD\n$NEW_PASSWORD\n$NEW_PASSWORD" | passwd
echo "if password is reported as changed, then it's now $LENGTH random characters and I didn't keep a copy.  tada!"
