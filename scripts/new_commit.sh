#!/bin/bash

# make and push a new commit to github
# Gather constant vars

# usage=> ./init.sh "name" "account"

NAME=$1
GITHUBUSER=$2

echo "Here we go..."
# echo "${GITHUBUSER}:${TOKEN}"
echo $NAME

cd d:
cd ${NAME}

git add --all
echo added
git commit -m "another commit"
echo new commit

git push -u origin gh-pages

echo "done"
