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

### [Versioning large files](https://git-lfs.github.com/)

Git Large File Storage (LFS) replaces large files such as audio samples, videos, datasets, and graphics with text pointers inside Git, while storing the file contents on a remote server like GitHub.com or GitHub Enterprise.

#### man

git-lfs/2.9.2 (GitHub; linux amd64; go 1.12.7; git 0274d856)
git lfs <command> [<args>]

Git LFS is a system for managing and versioning large files in
association with a Git repository.  Instead of storing the large files
within the Git repository as blobs, Git LFS stores special "pointer
files" in the repository, while storing the actual file contents on a
Git LFS server.  The contents of the large file are downloaded
automatically when needed, for example when a Git branch containing
the large file is checked out.

Git LFS works by using a "smudge" filter to look up the large file
contents based on the pointer file, and a "clean" filter to create a
new version of the pointer file when the large file's contents change.
It also uses a pre-push hook to upload the large file contents to
the Git LFS server whenever a commit containing a new large file
version is about to be pushed to the corresponding Git server.

Commands
--------

Like Git, Git LFS commands are separated into high level ("porcelain")
commands and low level ("plumbing") commands.

High level commands 
--------------------

* git lfs env:
    Display the Git LFS environment.
* git lfs checkout:
    Populate working copy with real content from Git LFS files.
* git lfs fetch:
    Download Git LFS files from a remote.
* git lfs fsck:
    Check Git LFS files for consistency.
* git lfs install:
    Install Git LFS configuration.
* git lfs lock:
    Set a file as "locked" on the Git LFS server.
* git lfs locks:
    List currently "locked" files from the Git LFS server.
* git lfs logs:
    Show errors from the Git LFS command.
* git lfs ls-files:
    Show information about Git LFS files in the index and working tree.
* git lfs migrate:
    Migrate history to or from Git LFS
* git lfs prune:
    Delete old Git LFS files from local storage
* git lfs pull:
    Fetch Git LFS changes from the remote & checkout any required working tree
    files.
* git lfs push:
    Push queued large files to the Git LFS endpoint.
* git lfs status:
    Show the status of Git LFS files in the working tree.
* git lfs track:
    View or add Git LFS paths to Git attributes.
* git lfs uninstall:
    Uninstall Git LFS by removing hooks and smudge/clean filter configuration.
* git lfs unlock:
    Remove "locked" setting for a file on the Git LFS server.
* git lfs untrack:
    Remove Git LFS paths from Git Attributes.
* git lfs update:
    Update Git hooks for the current Git repository.
* git lfs version:
    Report the version number.
  
Low level commands 
-------------------

* git lfs clean:
    Git clean filter that converts large files to pointers.
* git lfs pointer:
    Build and compare pointers.
* git lfs pre-push:
    Git pre-push hook implementation.
* git lfs filter-process:
    Git process filter that converts between large files and pointers.
* git lfs smudge:
    Git smudge filter that converts pointer in blobs to the actual content.
  
Examples
--------

To get started with Git LFS, the following commands can be used.

 1. Setup Git LFS on your system. You only have to do this once per
    repository per machine:

        git lfs install

 2. Choose the type of files you want to track, for examples all ISO
    images, with git lfs track:

        git lfs track "*.iso"

 3. The above stores this information in gitattributes(5) files, so
    that file need to be added to the repository:

        git add .gitattributes

 3. Commit, push and work with the files normally:

        git add file.iso
        git commit -m "Add disk image"
        git push



### [Large binaries files](https://help.github.com/en/github/managing-large-files/distributing-large-binaries)

### [Release](https://help.github.com/en/github/administering-a-repository/creating-releases)

```
hub release create -a prebuilt.zip -m 'release title' tag-name
```

