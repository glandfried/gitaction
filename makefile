install: /usr/local/bin/git-large-files /usr/local/bin/git-large-files-rm /usr/local/bin/git-hub-release /usr/local/bin/git-hub-release-add /usr/local/bin/git-submodule-rm
	
/usr/local/bin/git-large-files:
	sudo cp -f git-large-files /usr/local/bin/git-large-files
	sudo chmod +x /usr/local/bin/git-large-files
/usr/local/bin/git-large-files-rm:
	sudo cp -f git-large-files-rm /usr/local/bin/git-large-files-rm
	sudo chmod +x /usr/local/bin/git-large-files-rm
/usr/local/bin/git-hub-release: 	
	make hub-release -C setup/
	sudo cp -f git-hub-release /usr/local/bin/git-hub-release
	sudo chmod +x /usr/local/bin/git-hub-release
/usr/local/bin/git-hub-release-add: 	
	make hub-release -C setup/
	sudo cp -f git-hub-release-add /usr/local/bin/git-hub-release-add
	sudo chmod +x /usr/local/bin/git-hub-release-add
/usr/local/bin/git-submodule-rm:
	sudo cp -f git-submodule-rm /usr/local/bin/git-submodule-rm
	sudo chmod +x /usr/local/bin/git-submodule-rm
uninstall:
	- sudo rm -f /usr/local/bin/git-large-files
	- sudo rm -f /usr/local/bin/git-large-files-rm
	- sudo rm -f /usr/local/bin/git-hub-release
	- sudo rm -f /usr/local/bin/git-hub-release-add
	- sudo rm -f /usr/local/bin/git-submodule-rm


