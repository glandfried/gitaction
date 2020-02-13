# Git

In this repo I develop some usefull git commands.
You can install (and uninstall) them as bash commands by runing the ```makefile``` in you unix like OS.

To install the bash scripts as bash commands, run

```
make
```

**WARNING: Some commands may change the history of commits. Do not use them if you do not understand their consequences**

To uninstall the bash scripts, run

```
make uninstall
``` 

The bash scritps are.
See de source code for details.

0. git-large-files: show the size of files stored at git history
0. git-large-files-rm: remove and purge files from a git history
0. git-hub-release: create a new release in a Github project (Require ```hub```)
0. git-hub-release-add: add a file to an existing release Github project (Require ```hub```)
0. git-submodule-rm: safely remove a submodule in a git repository.

