#!/bin/bash -e
###############################################################################
### BATCH SCRIPT TO RUN THE ESMVALTOOL AT DKRZ MISTRAL
### Author: Mattia Righi (DLR)
###############################################################################
#SBATCH --partition=compute
#SBATCH --ntasks=8
#SBATCH --time=08:00:00
#SBATCH --mail-type=FAIL,END
#SBATCH --account=bd0854
#SBATCH --output=job_%j.out.log
#SBATCH --error=job_%j.err.log
###############################################################################

# Submit job with: sbatch job_DKRZ-MISTRAL.sh

# Input arguments
RECIPE=recipe_flato13ipcc_9_8.yml
CONFIG=config-user-dkrz.yml

cd ..
python setup.py install
cd esmvaltool
#esmvaltool -c $CONFIG --max-datasets 5 $RECIPE
esmvaltool -c $CONFIG $RECIPE

## Set environment
#CONDAPATH=  # e.g. /home/soft/miniconda3/
#CONDAENV=   # e.g. $CONDAPATH/envs/esmvaltool/bin
#ESMVALPATH= # e.g. /home/ESMValTool/esmvaltool
#
## Changes below this line should not be required
#export PATH=$PATH:$CONDAPATH/bin/
#conda info --envs
#$CONDAENV/esmvaltool $ESMVALPATH/recipes/$RECIPE -c $ESMVALPATH/$CONFIG
