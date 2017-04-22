#!/bin/bash

# copy a folder and push to github repo
# Gather constant vars

# usage=> ./read_file.sh "path" "post"

NAME=$1
PROJECT=$2

echo "Here we go..."
# echo "${GITHUBUSER}:${TOKEN}"
echo $NAME

cd d:
cp -R $PROJECT "${NAME}"
echo copied
