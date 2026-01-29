###HANDLING VCF

library(readr)
library(ape);
library(adegenet);
library(poppr);
library(vcfR)

vcf="filtered_mincov.recode.vcf"

file<-read.vcfR(vcf)

my_genind <- vcfR2genind(file)

###Setting pop

pop <- read_csv("pop.csv")

df <- data.frame(pops = pop$X2,
id = pop$X1)

test_pop<-my_genind

test_pop@pop <- as.factor(df$pops)

###AIC_SNAPCLUST

a.aic <- snapclust.choose.k(max=3,test_pop, IC = AIC);
a.bic <- snapclust.choose.k(max=3,test_pop, IC = BIC);

pdf(file="aic_calc_50k.pdf")
par(mfrow=c(2,1));
plot(1:3,a.aic,xlab='Number of clusters (k)', ylab = 'AIC', type ='b');
plot(1:3,a.bic,xlab='Number of clusters (k)', ylab = 'BIC', type ='b');

my.snapclust <- snapclust(test_pop, k=2);

grp <- find.clusters(test_pop, max.n.clust=3)


###TESTING LESS INDIVIDUALS

rem_ind<-c("SRR25249032.out.RG.sorted.fix.mate.dedup.bam", "SRR25249035.out.RG.sorted.fix.mate.dedup.bam", "SRR25249039.out.RG.sorted.fix.mate.dedup.bam")

ind_to_keep = colnames(file@gt)[!colnames(file@gt) %in% rem_ind]

snps_raw = file[samples=ind_to_keep]
write.vcf(snps_raw, "lessind_fromr.vcf")

nugenind <- vcfR2genind(snps_raw)

a.aic_lessind <- snapclust.choose.k(max=3,nugenind, IC = AIC);

a.bic_lessind <- snapclust.choose.k(max=3,nugenind, IC = BIC);

pdf(file="aic_calc_50k_lessind.pdf")
par(mfrow=c(2,1));
plot(1:3,a.aic_lessind,xlab='Number of clusters (k)', ylab = 'AIC', type ='b');
plot(1:3,a.bic_lessind,xlab='Number of clusters (k)', ylab = 'BIC', type ='b');


my.snapclust_lessind <- snapclust(nugenind, k=2);

grp_lessind <- find.clusters(nugenind, max.n.clust=3)

