#!/bin/bash
#$ -l h_rt=24:00:00
#$ -V
#$ -N landsat_stack
#$ -j y

module load batch_landsat

if [ -z "$1" ]; then
    echo "Error - please specify a directory with extracted Landsat archives. Usage:"
    echo "    $0 <directory>"
    exit 1
fi

here=$1

cd $here

sr="*sr*2.tif *sr*3.tif *sr*4.tif *sr*5.tif *sr*6.tif *sr*7.tif *toa*10.tif"
fmask="*cfmask.tif"

landsat_stack.py -q -p --files "$sr $fmask" \
    --ndv "-9999; -9999; -9999; -9999; -9999; -9999; -9999; 255" \
    --utm 19 -o "_stack" \
    --format "ENVI" --co "INTERLEAVE=BIP" \
     --image="/projectnb/landsat/projects/Chile/p231r092/images/LT52310922009269COA00/LT52310922009269COA00_stack" ./