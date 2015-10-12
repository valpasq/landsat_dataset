#!/bin/bash
#$ -l h_rt=72:00:00
#$ -V
#$ -N download_landsat
#$ -j y

source ~/modules.sh

cd /usr3/graduate/valpasq/bin/espa_bulk_downloader_v1.0.0/

python download_espa_order.py -e valpasq@bu.edu \
	-o valpasq@bu.edu-10092015-121456 \
	-d /projectnb/landsat/projects/Massachusetts/p012r031/