#!/bin/bash
#$ -l h_rt=72:00:00
#$ -V
#$ -N landsat_stack
#$ -j y

module load gdal/1.10.0
module load batch_landsat

if [ -z "$1" ]; then
    echo "Error - please specify a directory with extracted Landsat archives. Usage:"
    echo "    $0 <directory>"
    exit 1
fi

here=$1

cd $here

sr="*sr*1.tif *sr*2.tif *sr*3.tif *sr*4.tif *sr*5.tif *sr*7.tif"
fmask="*cfmask.tif"

landsat_stack.py -q -p --files "$sr $fmask" \
    -b "1; 1; 1; 1; 1; 1; 1; 1" \
    -n "-9999; -9999; -9999; -9999; -9999; -9999; -9999; 255" \
    --utm 19 -o "*_stack" \
    --format "ENVI" --co "INTERLEAVE=BIP" --min_extent ./
    
#    --image="/projectnb/landsat/projects/IDS/p012r031/images/LE70120311999188EDC00/LE70120311999188EDC00_stack" ./
    
    
