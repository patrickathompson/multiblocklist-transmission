## Multi-Blocklist BitTorrent Updater ##
***
#### For transmission-gtk on Debian Linux ####
***
1. Open terminal and type the following:

	```
	cd ~/.config/transmission 
	git init
	git remote add origin git@github.com:patrickathompson/multiblocklist-transmission.git
	git fetch
	git reset --hard origin/master
	```

2. Add url for blocklists from your favorite online source into the multiblocklist.conf file. <br>
	*(url must download a .gz or gzip file)*
3. Run the following command to update blocklists:

	```
	bash multiblocklist-updater.sh
	```
	
4. Start Transmission and Enjoy!