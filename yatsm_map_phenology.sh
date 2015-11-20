#!/bin/bash
#$ -l h_rt=72:00:00
#$ -V
#$ -N map_phenology
#$ -j y

source ~/modules.sh

if [ -z "$1" ]; then
    echo "Error - please specify a directory with extraced Landsat archives. Usage:"
    echo "    $0 <directory>"
    exit 1
fi

# First input is location of image directory
here=$1
cd $here

# Second input is date for harmonic extraction, e.g. 2006-06-01
date=$2

# Generate phenology map
yatsm -v map pheno $date ./pheno.gtif

