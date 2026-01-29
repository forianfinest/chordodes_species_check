#!/bin/bash
#SBATCH --job-name=trinity_test
#SBATCH --output=trinity_test_%A_%a.out
#SBATCH --error=trinity_test_%A_%a.err
#SBATCH --nodes=1
#SBATCH --ntasks-per-node=1
#SBATCH --cpus-per-task=8
#SBATCH --mem=56G
#SBATCH --time=48:00:00

# Load Python and activate the environment

. /home/YOURNAME/miniforge3/etc/profile.d/conda.sh

. /home/YOURNAME/miniforge3/etc/profile.d/mamba.sh

mamba activate trinity


# Run trinity

Trinity --seqType fq --max_memory 50G --left SRR25249029_1_edit.fastq --right SRR25249029_2_edit.fastq --CPU 6 --output 