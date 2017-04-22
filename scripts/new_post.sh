#!/bin/bash

# Creates a new post in jekyll
# Gather constant vars

# usage=> ./new_post.sh "path" "post" "post_path" ""
# ./new_post.sh "d:/h/_posts" "rails is very easy"

folder=$1
post_name=$2

cd $folder/_posts
touch $post_name

echo "done"
