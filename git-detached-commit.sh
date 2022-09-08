# Create temporary branch for your detached head
git branch tmp

# Go to master
git checkout master

# Merge in commits from previously detached head
git merge tmp

git push origin master

# Delete temporary branch
git branch -d tmp
