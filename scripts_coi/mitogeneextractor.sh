#!/bin/bash
#SBATCH -J example_run
#SBATCH --array=0-18%1        # Process 18 pairs, but only 1 at a time
#SBATCH --nodes=1
#SBATCH --ntasks-per-node=1
#SBATCH --cpus-per-task=24
#SBATCH --mem=144G             # Request 144 GB per job to handle the high memory usage

echo 'Your job is running on node(s):'
echo $SLURM_JOB_NODELIST
echo 'Cores per node:'
echo $SLURM_TASKS_PER_NODE

echo 'Your job is running on node(s):'
echo $SLURM_JOB_NODELIST
echo 'Cores per node:'
echo $SLURM_TASKS_PER_NODE

# Load necessary modules/environment
. /home/YOURNAME/miniforge3/etc/profile.d/conda.sh
. /home/YOURNAME/miniforge3/etc/profile.d/mamba.sh

mamba activate for_chordo

# Create an array of input files (without the _1.fastq/_2.fastq suffix)
input_files=($(ls *_1*.fastq | sed -r 's/_1[.]fastq//' | uniq))

# Use SLURM_ARRAY_TASK_ID to process only one file pair at a time
f=${input_files[$SLURM_ARRAY_TASK_ID]}

# Run MitoGeneExtractor on this file pair
/scratch/YOURNAME/large_files/MitoGeneExtractor/MitoGeneExtractor-v1.9.5 \
  -q "$f"_1.fastq \
  -q "$f"_2.fastq \
  -p chordodes_sp.fasta \
  -V vulgar_"$f".txt \
  -o $f/out-alignment_$f.fas \
  -n 0 \
  -c $f/out-consensus_$f.fas \
  -t 0.5 \
  -r 1 \
  -C 5

# Print status after each file is processed
echo "Processed file pair $f"

echo "Job completed!"