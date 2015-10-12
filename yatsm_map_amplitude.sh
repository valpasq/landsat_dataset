#!/bin/bash

source ~/modules.sh

date=2005-04-01

# Band 1
~/Documents/yatsm/scripts/yatsm_map.py -v --band "1" \
--ndv -9999 --before --amplitude coef $date ~/harm_b1.gtif

# Band 2
~/Documents/yatsm/scripts/yatsm_map.py -v --band "2" \
--ndv -9999 --before --amplitude coef $date ~/harm_b2.gtif

# Band 3
~/Documents/yatsm/scripts/yatsm_map.py -v --band "3" \
--ndv -9999 --before --amplitude coef $date ~/harm_b3.gtif

# Band 4
~/Documents/yatsm/scripts/yatsm_map.py -v --band "4" \
--ndv -9999 --before --amplitude coef $date ~/harm_b4.gtif

# Band 5
~/Documents/yatsm/scripts/yatsm_map.py -v --band "5" \
--ndv -9999 --before --amplitude coef $date ~/harm_b5.gtif

# Band 6
~/Documents/yatsm/scripts/yatsm_map.py -v --band "6" \
--ndv -9999 --before --amplitude coef $date ~/harm_b6.gtif

# Band 7
~/Documents/yatsm/scripts/yatsm_map.py -v --band "7" \
--ndv -9999 --before --amplitude coef $date ~/harm_b7.gtif

# Band 8
~/Documents/yatsm/scripts/yatsm_map.py -v --band "8" \
--ndv -9999 --before --amplitude coef $date ~/harm_B.gtif

# Band 9
~/Documents/yatsm/scripts/yatsm_map.py -v --band "9" \
--ndv -9999 --before --amplitude coef $date ~/harm_G.gtif

# Band 10
~/Documents/yatsm/scripts/yatsm_map.py -v --band "10" \
--ndv -9999 --before --amplitude coef $date ~/harm_W.gtif
