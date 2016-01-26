#!/bin/bash
#$ -l h_rt=72:00:00
#$ -V
#$ -N landsat_stack_wTC
#$ -j y

source ~/modules.sh

module load batch_landsat

if [ -z "$1" ]; then
    echo "Error - please specify a directory with extracted Landsat archives. Usage:"
    echo "    $0 <directory>"
    exit 1
fi

here=$1

cd $here

stack="L*stack"
TC="L*BGW.tif"

landsat_stack.py -q -p --files "$stack; $TC; $stack" \
    -b "1 2 3 4 5 6 7; 1 2 3; 8" \
    -n "-9999 -9999 -9999 -9999 -9999 -9999 -9999; -9999 -9999 -9999; 255" \
    --utm 19 -o "*_all" \
    --format "ENVI" --co "INTERLEAVE=BIP" --max_extent ./


