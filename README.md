# landsat_process
Shell scripts for running general Landsat processing

#### 0_gen_espa_list.sh
After downloading LT 4/5 and LE 7 comma-separated files from Earth Explorer, 
use this script to create a single text file that can be submitted to ESPA

#### 1_espa_download.sh
This script *should* allow you to download a completed ESPA order
Python code was obtained from the USGS. 
Note: As of last attempt (10-12-2015), all files downloaded with this script
could not be unzipped (see issue)

#### 2_unzip_archive.sh
This script extracts each downaloded .tar.gz to its own directory. 
Image directory will contain single-band images (raw and sr) and QA bands

#### 3_remove_L1G.sh
Before stacking images, remove all L1G files. 
(Georeferencing of L1G not suitable for time series analysis, use only if image is L1T)


