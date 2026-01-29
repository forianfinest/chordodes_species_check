#!/bin/bash
#SBATCH --job-name=index
#SBATCH --output=index_%A_%a.out
#SBATCH --error=index_%A_%a.err
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

input_files=($(ls *.RG.sorted.fix.mate.dedup.bam | grep -v '.RG.sorted.fix.mate.dedup.bam.bai' | sed -r 's/.RG.sorted.fix.mate.dedup.bam//' | uniq))

# Use SLURM_ARRAY_TASK_ID to process only one file pair at a time
f=${input_files[$SLURM_ARRAY_TASK_ID]}


# Run bam array
samtools index "$f".RG.sorted.fix.mate.dedup.bam -o "$f".RG.sorted.fix.mate.dedup.bam.bai
