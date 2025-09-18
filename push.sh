#!/bin/bash

#
# This is a simple script to automate a couple commands I have to run usually.
#

[[ -z $1 ]] && {
    echo 'Error: no commit message provided in $1' >&2
    exit 1
}

# get files modified today
TARGET_FILES="$(find . -type f -newermt "$(date +%Y-%m-%d)" ! -newermt "$(date -d tomorrow +%Y-%m-%d)")"

[[ -z $TARGET_FILES ]] && {
    echo 'TARGET_FILES is empty. Did you change anything today?' >&2
    exit 1
}

# render them with my own custom script
for file in "$TARGET_FILES"; do
    ~/bin/pd.sh $TARGET_FILE
done

git add -A
git commit -m "$1"
git push origin

