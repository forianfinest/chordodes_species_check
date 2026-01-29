plink2 --vcf data.vcf   --set-all-var-ids @:#:\$r:\$a   --make-bed   --out data_plink

plink2 --bfile data_plink --bad-ld --indep-pairwise 50 10 0.5   --out pruned_data

plink2 --bfile data_plink   --extract pruned_data.prune.in   --make-bed   --out data_lowLD

plink2 --bfile data_lowLD --recode vcf --out converted_data

sed 's/^##fileformat=VCFv4.3/##fileformat=VCFv4.2/' converted_data.vcf > out.vcf

vcftools --vcf out.vcf --max-missing 0.75 --recode --out filtered_mincov

###inputs for admixture

plink2 --allow-extra-chr --double-id --make-bed --out foradmixture --set-missing-var-ids @:# --vcf filtered_mincov.recode.vcf

sed 's/TRINITY_DN\([0-9]*\)_c[0-9]*_g[0-9]*/\1/g' foradmixture.bim > temp.bim
mv temp.bim foradmixture.bim

plink2   --allow-extra-chr --double-id --make-bed --out lessind --set-missing-var-ids @:# --vcf lessind_fromr.vcf

## Replace "TRINITY_DN" with numbers for avoiding issues

sed 's/TRINITY_DN\([0-9]*\)_c[0-9]*_g[0-9]*/\1/g' foradmixture.bim > temp.bim

mv temp.bim foradmixture.bim

sed 's/TRINITY_DN\([0-9]*\)_c[0-9]*_g[0-9]*/\1/g' lessind.bim > temp_lessind.bim

mv temp_lessind.bim lessind.bim



