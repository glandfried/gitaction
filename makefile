install: /usr/local/bin/git-large-files /usr/local/bin/git-large-files-rm /usr/local/bin/git-hub-release /usr/local/bin/git-hub-release-add /usr/local/bin/git-submodule-rm /usr/local/bin/git-lab-release-file
	
/usr/local/bin/git-large-files:
	sudo cp -f git-large-files.sh /usr/local/bin/git-large-files
	sudo chmod +x /usr/local/bin/git-large-files
/usr/local/bin/git-large-files-rm:
	sudo cp -f git-large-files-rm.sh /usr/local/bin/git-large-files-rm
	sudo chmod +x /usr/local/bin/git-large-files-rm
/usr/local/bin/git-hub-release: 	
	make hub-release -C setup/
	sudo cp -f git-hub-release.sh /usr/local/bin/git-hub-release
	sudo chmod +x /usr/local/bin/git-hub-release
/usr/local/bin/git-hub-release-add: 	
	make hub-release -C setup/
	sudo cp -f git-hub-release-add.sh /usr/local/bin/git-hub-release-add
	sudo chmod +x /usr/local/bin/git-hub-release-add
/usr/local/bin/git-submodule-rm:
	sudo cp -f git-submodule-rm.sh /usr/local/bin/git-submodule-rm
	sudo chmod +x /usr/local/bin/git-submodule-rm

/usr/local/bin/git-lab-release-file:
	sudo cp -f git-lab-release-file.sh /usr/local/bin/git-lab-release-file
	sudo chmod +x /usr/local/bin/git-lab-release-file
uninstall:
	- sudo rm -f /usr/local/bin/git-large-files
	- sudo rm -f /usr/local/bin/git-large-files-rm
	- sudo rm -f /usr/local/bin/git-hub-release
	- sudo rm -f /usr/local/bin/git-hub-release-add
	- sudo rm -f /usr/local/bin/git-submodule-rm


