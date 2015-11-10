#!/bin/bash
#$ -l h_rt=72:00:00
#$ -V
#$ -N yatsm_cache
#$ -j y

module load python/2.7.5
module load gdal/1.11.1
module load R/R-3.1.1

njob=50
for job in $(seq 1 $njob); do 
    qsub -j y -V -l h_rt=72:00:00 -N cache_$job -l eth_speed=10 -b y  \
        yatsm -v cache \
        /projectnb/landsat/users/valpasq/Southwest_fires/p035r032_config.yaml \
        $job $njob
done
