Automatically downloads all completed espa scenes.  Each scene is downloaded to the `--target_directory` and organized by order.

# Installation
* Note: These were tested with python 2.7.

* Clone this repository:
```
git clone https://github.com/USGS-EROS/espa-bulk-downloader.git bulk-downloader
cd bulk-downloader
python ./download_espa_order.py -h
```
* Install with pip automatically:
```
pip install git+https://github.com/USGS-EROS/espa-bulk-downloader.git
download_espa_order.py -h
```
* Alternatively you can just download the stand alone zip file which only requires python to run

### Runtime options
`-e or --email` The email address used to submit the order

`-o or --order` The order you wish to download.  Maybe also use `ALL`

`-d or --target_directory` The local directory to store downloaded scenes

`-u or --username` Your ERS username

`-p or --password` Your ERS password

Linux/Mac Example: `python ./download_espa_order.py -e your_email@server.com -o ALL -d /some/directory/with/free/space -u foo -p bar`

Windows Example: `C:\python27\python download_espa_order.py -e your_email@server.com -o ALL -d C:\some\directory\with\free\space -u foo -p bar`

# Notes
Retrieves all completed scenes for the user/order
and places them into the target directory.
Scenes are organized by order.

It is safe to cancel and restart the client, as it will
only download scenes one time (per directory)
 
If you intend to automate execution of this script,
please take care to ensure only 1 instance runs at a time.
Also please do not schedule execution more frequently than
once per hour.


    
