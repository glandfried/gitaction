#!/bin/sh

path=$1
git filter-branch --tree-filter "rm -rf $path" HEAD
