#!/bin/bash

KEY="dyn_update.conf"
SERVER="127.0.0.1"
IPADDR="$((RANDOM%255)).$((RANDOM%255)).$((RANDOM%255)).$((RANDOM%255))"

cat <<-EOF | nsupdate -k "$KEY"
	server $SERVER
	zone flatcap.org.
	update delete home.flatcap.org. A
	update add home.flatcap.org. 60 A $IPADDR
	send
EOF

host home.flatcap.org | grep "[0-9].*"

