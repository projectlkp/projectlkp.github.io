#!/bin/bash

# init a new folder and push to github  repo
# Gather constant vars

# usage=> ./init.sh "name" "account"

NAME=$1
GITHUBUSER=$2

echo "Here we go..."
# echo "${GITHUBUSER}:${TOKEN}"
echo $NAME

cd d:
cd ${NAME}
git init
git add --all
echo added
git checkout -b gh-pages
git commit -m "first commit"
echo new commit
git remote add origin git@github.com:$GITHUBUSER/$NAME
git push -u origin gh-pages

echo "done"
