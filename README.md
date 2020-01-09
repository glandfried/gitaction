# Git Good Practices

## Git

### [Write a good commit](https:/u/chris.beams.io/posts/git-commit/)

### [Find large files](https://stackoverflow.com/questions/10622179/how-to-find-identify-large-commits-in-git-history)

```bash
git rev-list --objects --all \
| git cat-file --batch-check='%(objecttype) %(objectname) %(objectsize) %(rest)' \
| sed -n 's/^blob //p' \
| sort --numeric-sort --key=2 \
| cut -c 1-12,41- \
| $(command -v gnumfmt || echo numfmt) --field=2 --to=iec-i --suffix=B --padding=7 --round=nearest
```

### [Remove large files](https://docs.gitlab.com/ee/user/project/repository/reducing_the_repo_size_using_git.html)

avigate to your repository:

```
cd my_repository/
```

Change to the branch you want to remove the big file from:

```
git checkout master
```

Use filter-branch to remove the big file:

```
git filter-branch --force --tree-filter 'rm -f path/to/big_file.mpg' HEAD
```

Instruct Git to purge the unwanted data:

```
git reflog expire --expire=now --all && git gc --prune=now --aggressive
```

Lastly, force push to the repository:

```
git push --force origin master
```

Your repository should now be below the size.

## Github

### [Large binaries files](https://help.github.com/en/github/managing-large-files/distributing-large-binaries)

#### [Release]()


