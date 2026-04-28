#!/bin/bash
#
# Print key information from `wannier90_hr.dat` file
#
# Usage: w90_hr_info.sh ${hr.dat}
#
# Created on Mar 25, 2026
#

echo "========================================"
echo "          Wannier90 hr_file             "
echo "----------------------------------------"
hrfile=$1

#------------------------------------------------
# Print number of Wannier functions
#------------------------------------------------
head -2 ${hrfile} | tail -1 | awk '{printf "Number of Wannier functions => %6d\n
", $1}'

#------------------------------------------------
# Print number of R-vectors
#------------------------------------------------
head -3 ${hrfile} | tail -1 | awk '{printf "Number of R-vectors         => %6d\n
", $1}'

#------------------------------------------------
# Print On-site terms
#------------------------------------------------
echo ""
echo "On-site terms:"
grep "^    0    0    0" ${hrfile} | awk '{if($4==$5){printf "%3d => %7.3f\n", $4
,$6}}'

echo "========================================"
