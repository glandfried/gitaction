all: hub-release

hub-release: /snap/bin/hub

/usr/bin/hub: /usr/bin/snap
	sh hub.sh
/usr/bin/snap: /usr/bin/go 
	sh snap.sh
/usr/bin/go:
	sh go.sh



