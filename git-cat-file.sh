#!/bin/bash

commit=$1
path=$2
git show $commit:$path > $(basename $path)
