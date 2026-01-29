###HANDLE ADMIXTURE DATA AND POP

###SEE ALSO THE SCRIPTS FOR HANDLING VCF AND MAKE SNAPCLUST ANALYSES

library(tidyverse)

tbl=read.table("foradmixture.2.Q")

pop <- read_csv("pop.csv")

mergedata<-cbind(pop,tbl)

mergedata<-mergedata %>% mutate(X1=str_remove_all(X1,".out.RG.sorted.fix.mate.dedup.bam"))

###FOR LESS INDIVIDUALS

tbl_lessind=read.table("lessind.2.Q")

pop2<-pop
pop2 <- pop[-c(16,19,23),] ###THEY MATCH THE INDIVIDUALS TO REMOVE
pop2<-pop2 %>% mutate(X1=str_remove_all(X1,".out.RG.sorted.fix.mate.dedup.bam"))

mergetab<-rbind(pop2,tbl_lessind)

###PREPARATION FOR COMPLOT

###HERE YOU NEED THE SNAPCLUST OUTPUTS

forplot_full<-data.frame(my.snapclust$proba)

forplot_full <- rownames_to_column(forplot_full, "sample")
forplot_full <-forplot_full  %>% mutate(sample=str_remove_all(sample,".out.RG.sorted.fix.mate.dedup.bam"))

pop3<-pop %>% mutate(sample=str_remove_all(sample,".out.RG.sorted.fix.mate.dedup.bam"))

complot_full<-left_join(pop3,forplot_full, by="sample")

###LESS IND

forplot_lessind<-data.frame(my.snapclust_lessind$proba)

forplot_lessind <- rownames_to_column(forplot_lessind, "sample")
forplot_lessind<-forplot_lessind %>% mutate(sample=str_remove_all(sample,".out.RG.sorted.fix.mate.dedup.bam"))

complot_lessind<-right_join(pop3,forplot_full, by="sample")


###SAVE

write_csv(mergedata, "data_admixture_all.csv")

write_csv(mergetab, "data_admixture_all_lessthan25.csv")

write_csv(complot_full, "complot_full.csv")

write_csv(complot_lessind, "complot_lessind.csv")

