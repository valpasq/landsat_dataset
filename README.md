# landsat_process
Shell scripts for running general Landsat processing

#### 0_gen_espa_list.sh
After downloading LT 4/5 and LE 7 comma-separated files from Earth Explorer, 
use this script to create a single text file that can be submitted to ESPA.

**Usage:**</br>
```0_gen_espa_list.sh [image directory] [WRS string]```

**Example of files:**</br>
```Earth Explorer File 1 - LSR_LANDSAT_ETM_COMBINED_p013r031.txt```</br>
```Earth Explorer File 2 - LSR_LANDSAT_TM_p013r031.txt```</br>

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Note: Need to rename .csv outputs where order ID is replaced by WRS string

**Command line:** </br>
```~/Documents/landsat_process/0_gen_espa_list.sh ./p012r031/images/ "p012r031"```
<br>
<br>

#### 1_espa_download.sh
Downloads single or all orders from ESPA; eliminates need to use DownloadThemAll

**Usage:** </br>
```1_espa_download.sh [email] [order ID] [dir]```

**Example:** </br>
```~/Documents/landsat_process/1_espa_download.sh valpasq@bu.edu valpasq@bu.edu-10162015-081003 ./images/```
<br>
<br>

#### 2_unzip_archive.sh
This script extracts each downaloded .tar.gz to its own directory. <br>
Image directory will contain single-band images (raw and sr) and QA bands
<br>
<br>

#### 3_remove_L1G.sh
Before stacking images, remove all L1G files. <br>
(Georeferencing of L1G not suitable for time series analysis, use only if image is L1T)
<br>
<br>

#### 4_stack_TIFF
Create stack of original bands plus Fmask result <br> 
*Band order:* 1-5, 7, 6, fmask [8 band stack]
<br>
<br>

#### 5_TC_Transform
Output BGW stack <br>
*Band order:* Brightness, Greenness, Wetness
<br>
<br>

#### 6_stack_wTC
Create stack of original bands, TC, and fmask result <br>
*Band order:* 1-5,7 6, B, G, W, fmask [11 band stack]
<br>
<br>

### Additional scripts:
#### clean_remove_cloudy.sh
Moves images where percentage of image covered by clouds and cloud shadows is greater than a set threshold to ```./images/cloudy/``` directory.
<br>

#### clean_remove_org_inputs.sh
For file clean up after stacking (typically used after 4_stack_TIFF) <br>
Removes original bands ```'L\*B[1-8]\*.TIF'```, surface reflectance products ```'L\*sr\*.tif'```, brightness temperature ```'L\*toa\*.tif'```, and fmask results ```'L\*cfmask\*'``` <br>
Archive (```.tar.gz```) is retained, can always unzip again to restore single band files.
<br> 

#### create_example_img.sh
Creates ```example_img``` file <br>




