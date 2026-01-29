#!/bin/bash
#SBATCH --job-name=bcf_variant
#SBATCH --output=bcf_variant_%A_%a.out
#SBATCH --error=bcf_variant_%A_%a.err
#SBATCH --nodes=1
#SBATCH --cpus-per-task=10
#SBATCH --mem=50G
#SBATCH --time=48:00:00

. /home/utr_devivo/miniforge3/etc/profile.d/conda.sh

. /home/utr_devivo/miniforge3/etc/profile.d/mamba.sh

mamba activate bcftools

#minor allele frequency
maf=0.02

# maximum number of alleles
maxa=2

bcftools view -O v -V indels -q ${maf}:minor -M $maxa --threads 4 genotyped.vcf > mafandmaxall.vcf