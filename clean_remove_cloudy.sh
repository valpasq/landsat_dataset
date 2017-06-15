#!/bin/bash
#$ -l h_rt=72:00:00
#$ -V
#$ -N remove_cloudy
#$ -j y

#module load batch_landsat/v4
#source ~/modules.sh

if [ -z "$1" ]; then
    echo "Error - please specify a directory with extracted Landsat archives. Usage:"
    echo "    $0 <directory>"
    exit 1
fi

here=$1

cd $here

~/Documents/misc/landsat/remove_cloudy.py \
	-v --dry-run --fmask "*all" --band 11 --clear "0, 1, 3" 80 ./