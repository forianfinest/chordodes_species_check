#!/bin/bash
#SBATCH --job-name=bam_trans
#SBATCH --output=bam_trans_%A_%a.out
#SBATCH --error=bam_trans_%A_%a.err
#SBATCH --array=0-18%1
#SBATCH --nodes=1
#SBATCH --ntasks-per-node=1
#SBATCH --cpus-per-task=8
#SBATCH --mem=44G
#SBATCH --time=48:00:00

# Load Python and activate the environment

. /home/YOURNAME/miniforge3/etc/profile.d/conda.sh

. /home/YOURNAME/miniforge3/etc/profile.d/mamba.sh

mamba activate chordo2

input_files=($(ls *_1_edit*.fastq | sed -r 's/_1_edit[.]fastq//' | uniq))

# Use SLURM_ARRAY_TASK_ID to process only one file pair at a time
f=${input_files[$SLURM_ARRAY_TASK_ID]}


# Run bam array
bwa mem new_with_trinity.Trinity.fasta "$f"_1_edit.fastq "$f"_2_edit.fastq > "$f".sam

samtools view -bS "$f".sam > "$f".bam