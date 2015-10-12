#!/bin/bash

module load python/2.7.5
module load gdal/1.11.1
module load R/R-3.1.1

njob=25
for job in $(seq 1 $njob); do 
    qsub -j y -V -l h_rt=24:00:00 -N yatsm_$job -l eth_speed=10 -b y  \
        yatsm line /projectnb/landsat/projects/IDS/p012r031/p012r031_config.yaml \
        $job $njob
done
