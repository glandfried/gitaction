#!/bin/bash

path=$1
git filter-branch --tree-filter "rm -rf $path" HEAD
git reflog expire --expire=now --all && git gc --prune=now --aggressive
