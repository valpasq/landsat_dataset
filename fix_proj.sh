#!/bin/bash
#$ -l h_rt=48:00:00
#$ -V
#$ -N fixproj
#$ -j y

module load gdal/1.10.0

if [ -z "$1" ]; then
    echo "Error - please specify a directory with extracted Landsat archives. Usage:"
    echo "    $0 <directory>"
    exit 1
fi

here=$1

cd $here

l_file=`find ./ -name '*_all'`
for l in $l_file; do
    echo "Fixing projection for $l"
    gdal_edit.py -a_srs "EPSG:32618" $l
    sed -i.bkup "s|.*WGS_1984_UTM_Zone_19N.*||g" ${l}.hdr
done