#!/bin/bash
#
# filename: slurm_script
#
# Example SLURM script to run a job on the svante cluster.
# The lines beginning #SBATCH set various queuing parameters.
#
# Set name of submitted job

#SBATCH -J example_run

#
# Ask for 1 n

#SBATCH -n 1

#
# Submit with maximum 48 hour walltime HH:MM:SS

#SBATCH -t 48:00:00

#
echo 'Your job is running on node(s):'
echo $SLURM_JOB_NODELIST
echo 'Cores per node:'
echo $SLURM_TASKS_PER_NODE

. /home/YOURNAME/miniforge3/etc/profile.d/conda.sh

. /home/YOURNAME/miniforge3/etc/profile.d/mamba.sh

mamba activate for_chordo

cat runaccessions.txt | parallel fastq-dump --gzip --readids --split-files
