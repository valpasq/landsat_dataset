I.   SYSTEM REQUIREMENTS
	- Python 2.7 or newer.

II.  COMMAND OPTIONS	
	download_espa_order.py [-h] -e EMAIL -o ORDER -d TARGET_DIRECTORY
	
	optional arguments:
	  -h, --help            show this help message and exit
	  -e EMAIL, --email EMAIL
							email address for the user that submitted the order)
	  -o ORDER, --order ORDER
							which order to download (use ALL for every order)
	  -d TARGET_DIRECTORY, --target_directory TARGET_DIRECTORY
							where to store the downloaded scenes
	
III. EXAMPLE USE
	A. Unzip all three files ('download_espa_order.py', 'feedparser.py', and 'README.txt') into same directory
	B. In the command prompt, 'cd' to the directory containing the unzipped files
	C. In the command prompt, call the 'download_espa_order.py' command and enter your options:
		Windows:	download_espa_order.py -e your_email@server.com -o your_email@server.com-0000000-000000 -d C:\some\directory\with\free\space
		Linux/Mac:	download_espa_order.py -e your_email@server.com -o your_email@server.com-0000000-000000 -d /some/directory/with/free/space

III. HELP TEXT
	Help text is accessible within the 'download_espa_order.py' tool by using the '-h' command. 
