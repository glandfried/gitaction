#!/bin/bash
file=$1
git log --follow -p -- $file
