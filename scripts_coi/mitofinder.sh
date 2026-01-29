#!/bin/bash
#SBATCH --job-name=mitofinder
#SBATCH --output=mitofinder_%A_%a.out
#SBATCH --error=mitofinder_%A_%a.err
#SBATCH --nodes=1
#SBATCH --ntasks-per-node=1
#SBATCH --cpus-per-task=5
#SBATCH --mem=20G
#SBATCH --time=48:00:00


# Load Python and activate the environment

. /home/YOURNAME/miniforge3/etc/profile.d/conda.sh

. /home/YOURNAME/miniforge3/etc/profile.d/mamba.sh

mamba activate singularity

# run

singularity run -B $PWD mitofinder_v1.4.2.sif -t "trnascan" -j SRR25249029 -1 SRR25249029_1.fastq -2 SRR25249029_2.fastq -m 16 -p 4 -r chordo_ref.gb -o 5

singularity run -B $PWD mitofinder_v1.4.2.sif -t "trnascan" -j SRR25249039 -1 SRR25249039_1.fastq -2 SRR25249039_2.fastq -m 16 -p 4 -r chordo_ref.gb -o 5

singularity run -B $PWD mitofinder_v1.4.2.sif -t "trnascan" -j SRR25249039 -1 SRR25249043_1.fastq -2 SRR25249043_2.fastq -m 16 -p 4 -r chordo_ref.gb -o 5