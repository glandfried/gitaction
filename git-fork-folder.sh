#!/bin/bash
# see https://github.com/orgs/community/discussions/23346#discussioncomment-3239979

# Example
# git fork-folder git@github:.../repo.git folder where

source=$1 # https://github.com/user/source.git
folder=$2 # foo/
path=$3 # new_repo/

mkdir destintaion/

# The goal here is to copy from a repo named source to a repo named destination only the contents of folder foo, including all history that touches folder foo. In order to do that, because Git doesn’t track folders per se but tracks commits, we’ll have to filter the commit history of the source repo to only contain the commits that touch folder foo. The way we’ll do that is via the git filter-branch command using the --subdirectory-filter filter. First, we’ll need to create a local copy of the source repo  separate from any local copy you already have. You can do this by doing the following:

# git clone https://github.com/user/source.git backup
# cd backup

git clone $source $path
cd $path

# Now, we are in the directory backup/source which is a completely new local copy of the source repo separate from any local copy you already have. Additionally, we want to protect https://github.com/user/source from being accidentally changed by our process here. We do that by deleting the origin remote,  but only in this new local copy.

git remote rm origin

# Next, we want to filter the commit history of the source.git repo to only contain the commits that touch folder foo. We do that by issuing the filter-branch command:

git filter-branch --subdirectory-filter $folder -- --all

# But, as you’ll notice in the documentation for the git filter-branch --subdirectory-filter command, it states:
#
#       The result will contain that directory (and only that) as its project root.
#
#  This means that everything that  was in foo is now in the root of the repo. So, in order to put it all back in folder foo, we have to add one commit to this  local only temporary working repository that we’re going to throw away soon:
#
# mkdir foo
# mv * foo
# git add .
# git commit

# Now we have a local repository that contains only the files and history that we want. We’re halfway there! And remember, this is just a temporary place to store some work. It is completely separated from your normal local source repository and from https://github.com/user/source, so any changes we make here are not permanent. It’s like making a temporary backup of a file so that you can revert back to the original if you screw something up.

echo "Add a new remote origin"

# Go to github.
# Log in to your account.
# Click the new repository button in the top-right. You’ll have an option there to initialize the repository with a README file, but I don’t.
# Click the "Create repository" button.

# ####################
# Run:
# git remote add origin git@github.com:glandfried/tesis.git
#
# ###################

echo "Then push"

# git push origin main

