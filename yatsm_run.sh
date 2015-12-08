#!/bin/bash

config=$1

njob=500
for job in $(seq 1 $njob); do 
    qsub -j y -V -l h_rt=24:00:00 -N yatsm_$job -b y  \
        yatsm -v line --resume $config \
        $job $njob
done
