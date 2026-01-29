#!/bin/bash
#SBATCH --job-name=sort
#SBATCH --output=sort_%A_%a.out
#SBATCH --error=sort_%A_%a.err
#SBATCH --array=0-45%1
#SBATCH --nodes=1
#SBATCH --ntasks-per-node=1
#SBATCH --cpus-per-task=8
#SBATCH --mem=44G
#SBATCH --time=48:00:00

# Load Python and activate the environment

. /home/YOURNAME/miniforge3/etc/profile.d/conda.sh

. /home/YOURNAME/miniforge3/etc/profile.d/mamba.sh

mamba activate chordo2

input_files=($(ls *.bam | grep -v '.sorted.' | sed -r 's/.bam//' | uniq))

# Use SLURM_ARRAY_TASK_ID to process only one file pair at a time
f=${input_files[$SLURM_ARRAY_TASK_ID]}


# Run bam array
samtools sort "$f".bam -o "$f".sorted.bam
