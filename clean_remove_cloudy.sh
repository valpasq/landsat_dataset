#!/bin/bash
#$ -l h_rt=72:00:00
#$ -V
#$ -N remove_cloudy
#$ -j y

module load batch_landsat/v4

if [ -z "$1" ]; then
    echo "Error - please specify a directory with extracted Landsat archives. Usage:"
    echo "    $0 <directory>"
    exit 1
fi

here=$1

cd $here

remove_cloudy.py -v --fmask "*stack" --band 8 --clear "0, 1" 20 ./