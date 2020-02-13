#!/bin/bash
file=$1
tag=$2
hub release edit -a $file $tag
