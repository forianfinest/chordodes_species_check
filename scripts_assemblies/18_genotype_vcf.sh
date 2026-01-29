#!/bin/bash
#SBATCH --job-name=genotype_vcf
#SBATCH --output=genotype_vcf_%A_%a.out
#SBATCH --error=genotype_vcf_%A_%a.err
#SBATCH --nodes=1
#SBATCH --ntasks-per-node=1
#SBATCH --cpus-per-task=24
#SBATCH --mem=100G
#SBATCH --time=48:00:00

# Load Python and activate the environment

. /home/utr_devivo/miniforge3/etc/profile.d/conda.sh

. /home/utr_devivo/miniforge3/etc/profile.d/mamba.sh

mamba activate gatk

GenomeAnalysisTK -Xmx88G -T GenotypeGVCFs -R ../new_with_trinity.Trinity.fasta -V combined.g.vcf -o genotyped.vcf