# landsat_dataset
This is a repository of example shell scripts for running general Landsat processing. </br>
Numbered scripts correspond to the most basic processing steps (list, download, unzip, remove l1G and stack). </br>
All other scripts are grouped by general purpose (clear, fix, stack, transform). </br>

## Basic processing:
<br>
<br>
#### List: 0_gen_espa_list.sh
Use this script to create a list of images for an ESPA order Script is used after downloading a full list of LT 4/5 and LE 7 comma-separated files from Earth Explorer. File naming convention: LSR_LANDSAT_ETM_COMBINED_pXXXrXXX.txt; LSR_LANDSAT_TM_pXXXrXXX.txt

**Usage:**</br>
```0_gen_espa_list.sh [image directory] [WRS string]```

**Example of files:**</br>
```Earth Explorer File 1: LSR_LANDSAT_ETM_COMBINED_p013r031.txt```</br>
```Earth Explorer File 2: LSR_LANDSAT_TM_p013r031.txt```</br>

**Command line:** </br>
```~/Documents/landsat_process/0_gen_espa_list.sh ./p012r031/images/ "p012r031"```
<br>
<br>

#### Download: 1_espa_download.sh
This script downloads single or all orders from ESPA; eliminates need to use DownloadThemAll

**Usage:** </br>
```1_espa_download.sh [email] [order ID] [dir]```

**Example:** </br>
```~/Documents/landsat_process/1_espa_download.sh valpasq@bu.edu valpasq@bu.edu-10162015-081003 ./images/```
<br>
<br>

#### Unzip: 2_unzip_archive.sh
This script extracts each downaloded .tar.gz to its own directory. <br>
Image directory will contain single-band images (raw and sr) and QA bands
<br>
<br>

#### Remove L1G: 3_remove_L1G.sh
This script removes all L1G images prior to stacking. Only L1T images will be stacked and used in time series analysis<br>
<br>
<br>

#### 8-band stack: 4_stack_TIFF
This script create stacks of original bands plus Fmask result and organizes image directories <br> 
*Band order:* 1-5, 7, 6, fmask [8 band stack]
<br>
<br>


## Optional data management:

### Tranformations:

#### transform_TC.sh
Applies Tassled Cap tranformation for Landsat reflectance factor data (Crist 1985)
using /ceholden/misc/spectral/transforms.py.

Generates new 3-band "L*_BGW.tif" stack <br>
*Band order:* Brightness, Greenness, Wetness
<br>
<br>

#### transform_index.sh
Applies a variety of index tranformations using /ceholden/misc/spectral/transforms.py. 
Options: NDVI, NBR, NDMI, EVI.
Generates new "L*_index.tif" stack <br>
<br>
<br>


### Stacking:

#### stack_wTC
Create stack of original bands, TC, and fmask result <br>
*Band order:* 1-5,7 6, B, G, W, fmask [11 band stack]
<br>
<br>


### Directory Cleanup: 

#### clean_remove_cloudy.sh
Moves images where percentage of image covered by clouds and cloud shadows is greater than a set threshold to ```./images/cloudy/``` directory.
<br>
<br>

#### clean_remove_org_inputs.sh
For file clean up after stacking (typically used after 4_stack_TIFF) <br>
Removes original bands ```'L*B[1-8]*.TIF'```, surface reflectance products ```'L*sr*.tif'```, brightness temperature ```'L*toa*.tif'```, and fmask results ```'L*cfmask*'``` <br>
Archive (```.tar.gz```) is retained, can always unzip again to restore single band files.
<br> 
<br>

#### clean_remove_general.sh
Used to remove files from all L* directories <br>

**Usage:** </br>
```clean_remove_general.sh [dir] [text to match]```

**Examples:** </br>
Remove _stack and _BGW images after creating 11-band stack
```~/Documents/landsat_process/clean_remove_general.sh ./p012r031/images/ "*_stack*"```
```~/Documents/landsat_process/clean_remove_general.sh ./p012r031/images/ "*_BGW*"```
<br>
<br>


### Create example image:

#### create_example_img.sh
Creates ```example_img``` file for time series model configuration<br>




