#!/bin/bash

# Publish new changes to github repo from the command line.
# Gather constant vars

# usage=> ./publish.sh "path"

folder_path=$1

cd $folder_path
echo $folder_path

git add --all
git commit -m "new commit"
git push origin gh-pages
