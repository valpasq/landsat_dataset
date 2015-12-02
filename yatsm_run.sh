#!/bin/bash

config=$1

njob=100
for job in $(seq 1 $njob); do 
    qsub -j y -V -l h_rt=72:00:00 -N yatsm_$job -l eth_speed=10 -b y  \
        yatsm -v line --resume $config \
        $job $njob
done
