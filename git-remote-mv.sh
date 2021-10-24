#!/bin/bash

new=$1
other1=$2
git remote rm origin
git remote add origin new
git remote set-url --add origin other1


