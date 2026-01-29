#!/bin/bash
#SBATCH --job-name=fastqc
#SBATCH --output=fastqc_%A_%a.out
#SBATCH --error=fastqc_%A_%a.err
#SBATCH --array=0-45%1
#SBATCH --nodes=1
#SBATCH --ntasks-per-node=1
#SBATCH --cpus-per-task=4
#SBATCH --mem=16G
#SBATCH --time=2:00:00

# Load Python and activate the environment

. /home/YOURNAME/miniforge3/etc/profile.d/conda.sh

. /home/YOURNAME/miniforge3/etc/profile.d/mamba.sh

mamba activate for_chordo

# Run FastQC, in case you do no trust the fact the reads are trimmed already
fastqc --verbose *.fastq.gz

