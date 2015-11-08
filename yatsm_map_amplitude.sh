#!/bin/bash
#$ -l h_rt=72:00:00
#$ -V
#$ -N map_amplitudes
#$ -j y

source ~/modules.sh

cd $1

date=2006-06-01


# Band 1
yatsm map --band 1 \
--ndv -9999 --before --amplitude coef $date ./harm_b1.gtif

# Band 2
yatsm map --band 2 \
--ndv -9999 --before --amplitude coef $date ./harm_b2.gtif

# Band 3
yatsm map --band 3 \
--ndv -9999 --before --amplitude coef $date ./harm_b3.gtif

# Band 4
yatsm map --band 4 \
--ndv -9999 --before --amplitude coef $date ./harm_b4.gtif

# Band 5
yatsm map --band 5 \
--ndv -9999 --before --amplitude coef $date ./harm_b5.gtif

# Band 6
yatsm map --band 6 \
--ndv -9999 --before --amplitude coef $date ./harm_b6.gtif

# Band 7
yatsm map --band 7 \
--ndv -9999 --before --amplitude coef $date ./harm_b7.gtif

# Band 8
yatsm map --band 8 \
--ndv -9999 --before --amplitude coef $date ./harm_B.gtif

# Band 9
yatsm map --band 9 \
--ndv -9999 --before --amplitude coef $date ./harm_G.gtif

# Band 10
yatsm map --band 10 \
--ndv -9999 --before --amplitude coef $date ./harm_W.gtif
