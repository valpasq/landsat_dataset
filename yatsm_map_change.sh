#!/bin/bash
#$ -l h_rt=72:00:00
#$ -V
#$ -N map_change
#$ -j y

source ~/modules.sh

startdate=1982-01-01
enddate=2015-01-01

# Generate phenology map
yatsm changemap first $startdate $enddate ./changemap_first.gtif

