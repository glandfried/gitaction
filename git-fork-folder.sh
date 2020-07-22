#!/bin/bash
# see https://github.community/t/adding-a-folder-from-one-repo-to-another/781

source=$1
folder=$2
path=$3
git clone $source $path
cd $path
git remote rm origin
git filter-branch --subdirectory-filter $folder -- --all
echo "Add a new remote origin"
echo "Then push"



