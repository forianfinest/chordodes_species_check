#!/bin/bash
#SBATCH --job-name=PrintReads
#SBATCH --output=PrintReads_%A_%a.out
#SBATCH --error=PrintReads_%A_%a.err
#SBATCH --array=0-45%1
#SBATCH --nodes=1
#SBATCH --ntasks-per-node=1
#SBATCH --cpus-per-task=24
#SBATCH --mem=100G
#SBATCH --time=48:00:00

# Load Python and activate the environment

. /home/YOURNAME/miniforge3/etc/profile.d/conda.sh

. /home/YOURNAME/miniforge3/etc/profile.d/mamba.sh

mamba activate gatk

input_files=($(ls *RG.sorted.fix.mate.dedup.bam | sed -r 's/.RG.sorted.fix.mate.dedup.bam//' | uniq))

# Use SLURM_ARRAY_TASK_ID to process only one file pair at a time
f=${input_files[$SLURM_ARRAY_TASK_ID]}

GenomeAnalysisTK -Xmx88G -T PrintReads -R new_with_trinity.Trinity.fasta -I "$f".RG.sorted.fix.mate.dedup.bam -BQSR "$f".RG.sorted.fix.mate.dedup.recalibration.report.grp -o "$f".RG.sorted.fix.mate.dedup.recall.bam

