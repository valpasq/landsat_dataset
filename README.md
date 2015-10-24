# landsat_process
Shell scripts for running general Landsat processing

#### 0_gen_espa_list.sh
After downloading LT 4/5 and LE 7 comma-separated files from Earth Explorer, 
use this script to create a single text file that can be submitted to ESPA.

Usage:
0_gen_espa_list.sh [image directory] [WRS string]

Example:
Earth Explorer File 1 - LSR_LANDSAT_ETM_COMBINED_p013r031.txt**
Earth Explorer File 2 - LSR_LANDSAT_TM_p013r031.txt**

**Note: Need to rename .csv outputs where order ID is replaced by WRS string

Command line -
~/Documents/landsat_process/0_gen_espa_list.sh ./p012r031/images/ "p012r031"


#### 1_espa_download.sh
Downloads single or all orders from ESPA; eliminates need to use DownloadThemAll

Usage:
1_espa_download.sh [email] [order ID] [dir]

Example:
~/Documents/landsat_process/1_espa_download.sh valpasq@bu.edu valpasq@bu.edu-10162015-081003 ./images/


#### 2_unzip_archive.sh
This script extracts each downaloded .tar.gz to its own directory. 
Image directory will contain single-band images (raw and sr) and QA bands

#### 3_remove_L1G.sh
Before stacking images, remove all L1G files. 
(Georeferencing of L1G not suitable for time series analysis, use only if image is L1T)

#### 4_stack_TIFF
Create stack of original bands plus Fmask result 
Band order: 1-5, 7, 6, fmask [8 band stack]

#### 5_TC_Transform
Output BGW stack
Band order: Brightness, Greenness, Wetness

### 6_stack_wTC
Create stack of original bands, TC, and fmask result
Band order: 1-5,7 6, B, G, W, fmask [11 band stack]


### Additional scripts:

#### clean_remove_cloudy.sh
Removes images where percentage of image covered by clouds and cloud shadows is greater than a set threshold

#### clean_remove_files.sh
Removes various files generated throughout processing






