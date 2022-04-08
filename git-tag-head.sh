#!/bin/bash
# assuming you are in the branch referencing currently the right new commit:
git tag -f -a <tagname>

# push your new commit:
git push 

# force push your moved tag:
git push origin -f <tagname>
