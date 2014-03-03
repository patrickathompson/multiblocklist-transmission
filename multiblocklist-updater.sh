#!/bin/bash

echo && echo "Updating BitTorrent P2P Blocklists..."


rm -f blocklists/*.bin

count=1

for line in $(cat multiblocklist.conf); do
	echo && echo "Downloading List $count..."
	if wget -q -Oblocklists/$count.gz $line; then
		echo "Download Complete!"
		gunzip -fN blocklists/$count.gz && rm -f blocklists/$count.gz
		echo "Extraction of List $count completed!"
	else
		echo "The following url:"
		echo $line
		echo "FAILED to download!!!"
	fi;
	let count=count+1
done;

echo && echo "BitTorrent P2P Blocklists Update Complete!!!" && echo

exit 0