#!/bin/bash
#SBATCH --job-name=index_chordoref
#SBATCH --output=index_chordoref_%A_%a.out
#SBATCH --error=index_chordoref_%A_%a.err
#SBATCH --nodes=1
#SBATCH --cpus-per-task=8
#SBATCH --mem=44G
#SBATCH --time=48:00:00

# Load Python and activate the environment

. /home/YOURNAME/miniforge3/etc/profile.d/conda.sh

. /home/YOURNAME/miniforge3/etc/profile.d/mamba.sh

mamba activate chordo2

bwa index new_with_trinity.Trinity.fasta

mamba deactivate

mamba activate picard

picard CreateSequenceDictionary -R new_with_trinity.Trinity.fasta -O new_with_trinity.Trinity.dict

mamba deactivate

mamba activate samtools

samtools faidx new_with_trinity.Trinity.fasta  -o new_with_trinity.Trinity.fai

mamba deactivate

mamba activate gatk4

/home/YOURNAME/miniforge3/envs/gatk4/bin/gatk BwaMemIndexImageCreator -I new_with_trinity.Trinity.fasta -O new_with_trinity.Trinity.img