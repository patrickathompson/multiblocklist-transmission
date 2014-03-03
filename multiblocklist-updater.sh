#!/bin/bash

echo && echo "Updating BitTorrent P2P Blocklists..."

rm -f blocklists/*.bin blocklists/*.txt

count=1

for line in $(cat multiblocklist.conf); do

	if [[ $line =~ ^# ]]; then
		echo && echo "Skipping List $count. Edit multiblocklist.conf to enable.."
	elif [[ $line == http* ]]; then
		echo && echo "Downloading List $count..."
		if wget -q -Oblocklists/$count.gz $line; then
			echo "Download Complete!"
			gunzip -fN blocklists/$count.gz && rm -f blocklists/$count.gz
			echo "Extraction of List $count completed!"
		else
			echo "The following url:"
			echo $line
			echo "FAILED to download!!!"
			rm -f blocklists/$count.gz
		fi;
	else
		echo && echo "Error! Check List $count in your multiblocklist.conf file for errors..."
	fi;
	let count=count+1
done;

echo && echo "BitTorrent P2P Blocklists Update Complete!!!" && echo

exit 0