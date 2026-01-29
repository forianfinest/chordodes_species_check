#!/bin/bash
#SBATCH --job-name=confidenc_vcf
#SBATCH --output=confidenc_vcf_%A_%a.out
#SBATCH --error=confidenc_vcf_%A_%a.err
#SBATCH --nodes=1
#SBATCH --ntasks-per-node=1
#SBATCH --cpus-per-task=24
#SBATCH --mem=100G
#SBATCH --time=48:00:00

# Load Python and activate the environment

. /home/utr_devivo/miniforge3/etc/profile.d/conda.sh

. /home/utr_devivo/miniforge3/etc/profile.d/mamba.sh

mamba activate gatk

GenomeAnalysisTK -Xmx88G -T CombineGVCFs -R ../new_with_trinity.Trinity.fasta --variant SRR22822833.RG.sorted.fix.mate.dedup.after.recall.g.vcf \
--variant SRR22822835.RG.sorted.fix.mate.dedup.after.recall.g.vcf \
--variant SRR22822837.RG.sorted.fix.mate.dedup.after.recall.g.vcf \
--variant SRR22822842.RG.sorted.fix.mate.dedup.after.recall.g.vcf \
--variant SRR22822849.RG.sorted.fix.mate.dedup.after.recall.g.vcf \
--variant SRR22822852.RG.sorted.fix.mate.dedup.after.recall.g.vcf \
--variant SRR22822860.RG.sorted.fix.mate.dedup.after.recall.g.vcf \
--variant SRR22822862.RG.sorted.fix.mate.dedup.after.recall.g.vcf \
--variant SRR25249025.RG.sorted.fix.mate.dedup.after.recall.g.vcf \
--variant SRR25249026.RG.sorted.fix.mate.dedup.after.recall.g.vcf \
--variant SRR25249027.RG.sorted.fix.mate.dedup.after.recall.g.vcf \
--variant SRR25249028.RG.sorted.fix.mate.dedup.after.recall.g.vcf \
--variant SRR25249029.RG.sorted.fix.mate.dedup.after.recall.g.vcf \
--variant SRR25249030.RG.sorted.fix.mate.dedup.after.recall.g.vcf \
--variant SRR25249031.RG.sorted.fix.mate.dedup.after.recall.g.vcf \
--variant SRR25249032.RG.sorted.fix.mate.dedup.after.recall.g.vcf \
--variant SRR25249033.RG.sorted.fix.mate.dedup.after.recall.g.vcf \
--variant SRR25249034.RG.sorted.fix.mate.dedup.after.recall.g.vcf \
--variant SRR25249035.RG.sorted.fix.mate.dedup.after.recall.g.vcf \
--variant SRR25249036.RG.sorted.fix.mate.dedup.after.recall.g.vcf \
--variant SRR25249037.RG.sorted.fix.mate.dedup.after.recall.g.vcf \
--variant SRR25249038.RG.sorted.fix.mate.dedup.after.recall.g.vcf \
--variant SRR25249039.RG.sorted.fix.mate.dedup.after.recall.g.vcf \
--variant SRR25249040.RG.sorted.fix.mate.dedup.after.recall.g.vcf \
--variant SRR25249041.RG.sorted.fix.mate.dedup.after.recall.g.vcf \
--variant SRR25249042.RG.sorted.fix.mate.dedup.after.recall.g.vcf \
--variant SRR25249043.RG.sorted.fix.mate.dedup.after.recall.g.vcf \
-o combined.g.vcf