#!/bin/bash
#SBATCH --job-name=bam_radseq_nuref
#SBATCH --output=bam_radseq_nuref%A_%a.out
#SBATCH --error=bam_radseq_nuref%A_%a.err
#SBATCH --array=0-26%1
#SBATCH --nodes=1
#SBATCH --ntasks-per-node=1
#SBATCH --cpus-per-task=8
#SBATCH --mem=44G
#SBATCH --time=48:00:00

# Load Python and activate the environment

. /home/utr_devivo/miniforge3/etc/profile.d/conda.sh

. /home/utr_devivo/miniforge3/etc/profile.d/mamba.sh

mamba activate chordo2

input_files=($(ls *.fastq.gz | uniq))

# Use SLURM_ARRAY_TASK_ID to process only one file pair at a time
f=${input_files[$SLURM_ARRAY_TASK_ID]}


# Run bam array
bwa mem new_with_trinity.Trinity.fasta "$f" > "$f".sam

samtools view -bS "$f".sam > "$f".bam