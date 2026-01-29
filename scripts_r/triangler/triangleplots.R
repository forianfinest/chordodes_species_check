###TRIANGULAR PLOTS

library(triangulaR)
library(ggpubr)

###USE SAME POP USED EARLIER

pop_triangle<-pop
colnames(pop_triangle)<-c("id",pop)

pop_triangle2<-pop2
colnames(pop_triangle2)<-c("id","pop")


###CHANGE TO SOME POP
pop_triangle$pop[pop_triangle$pop == 'POTCF'] <- 'TWN'

pop_triangle2$pop[pop_triangle2$pop == 'POTCF'] <- 'TWN'

pop_triangle2$pop[pop_triangle2$id == 'SRR25249029.out.RG.sorted.fix.mate.dedup.bam'] <- 'POTHYB'
pop_triangle2$pop[pop_triangle2$id == 'SRR25249031.out.RG.sorted.fix.mate.dedup.bam'] <- 'POTHYB'

pop_triangle$pop[pop_triangle$id == 'SRR25249031.out.RG.sorted.fix.mate.dedup.bam'] <- 'POTHYB'
pop_triangle$pop[pop_triangle$id == 'SRR25249039.out.RG.sorted.fix.mate.dedup.bam'] <- 'POTHYB'
pop_triangle$pop[pop_triangle$id == 'SRR25249029.out.RG.sorted.fix.mate.dedup.bam'] <- 'POTHYB'
pop_triangle$pop[pop_triangle$id == 'SRR25249032.out.RG.sorted.fix.mate.dedup.bam'] <- 'POTHYB'
pop_triangle$pop[pop_triangle$id == 'SRR25249035.out.RG.sorted.fix.mate.dedup.bam'] <- 'POTHYB'

###I USED SAME VCFS USED FOR SNAPCLUST; IF YOU WANT TO RELOAD

###library(vcfR)

##vcf="filtered_mincov.recode.vcf"

##file<-read.vcfR(vcf)

##rem_ind<-c("SRR25249032.out.RG.sorted.fix.mate.dedup.bam", "SRR25249035.out.RG.sorted.fix.mate.dedup.bam", "SRR25249039.out.RG.sorted.fix.mate.dedup.bam")

##ind_to_keep = colnames(file@gt)[!colnames(file@gt) %in% rem_ind]

##snps_raw = file[samples=ind_to_keep]

example.vcfR.diff <- alleleFreqDiff(vcfR = file, pm = pop_triangle, p1 = "TWN", p2 = "CJPOT", difference = 1)
hi.het <- hybridIndex(vcfR = example.vcfR.diff, pm = pop_triangle, p1 = "TWN", p2 = "CJPOT")
cols <- c("#af8dc3", "#7fbf7b", "#bababa", "#878787", "#762a83", "#1b7837")
# View triangle plot
allt<-triangle.plot(hi.het, colors = cols)

example.vcfR.diff_lessind <- alleleFreqDiff(vcfR = snps_raw , pm = pop_triangle2, p1 = "TWN", p2 = "CJPOT", difference = 1)
hi.het_lessind <- hybridIndex(vcfR = example.vcfR.diff_lessind, pm = pop_triangle2, p1 = "TWN", p2 = "CJPOT")
# View triangle plot
lesst<-triangle.plot(hi.het_lessind, colors = cols)

ggarrange(allt,lesst,ncol=1,nrow=2, labels=c("A)","B)"), legend=c("bottom"),common.legend=TRUE)