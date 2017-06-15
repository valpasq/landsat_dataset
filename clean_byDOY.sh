#!/bin/bash
#$ -V
#$ -l h_rt=24:00:00
#$ -N ST_merge
#$ -j y

echo "cleaning..."

for year in $(seq 1985 2016); do
	echo $year	
	mv -t ../DOY_filt ./L*${year}2*
done

echo "done"
