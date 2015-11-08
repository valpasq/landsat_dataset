#!/bin/bash
#$ -l h_rt=72:00:00
#$ -V
#$ -N map_phenology
#$ -j y

source ~/modules.sh

date=2006-06-01

# Generate phenology map
yatsm map pheno $date ./pheno.gtif

