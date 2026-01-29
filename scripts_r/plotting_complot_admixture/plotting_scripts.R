###FOR PLOTTING COMPLOT AND ADMIXTURE RESULTS

library(tidyverse)
library(xadmix)
library(cowplot)

###LOAD CSVs AND EDIT

complot_full <- read_csv("complot_full.csv")

colnames(complot_full)<-c("sample", "group", "potcformo", "potcjap")

complot_lessind <- read_csv("complot_lessind.csv")

colnames(complot_lessind )<-c("sample", "group", "potcformo", "potcjap")

data_admixture_all_lessthan25 <- read_csv("data_admixture_all_lessthan25.csv")

colnames(data_admixture_all_lessthan25 )<-c("sample", "group", "potcformo", "potcjap")

data_admixture_all <- read_csv("data_admixture_all.csv")

colnames(data_admixture_all )<-c("sample", "group", "potcjap", "potcformo")

data_admixture_all_lessthan25 <- read_csv("data_admixture_all.csv")

colnames(data_admixture_all_lessthan25)<-c("sample", "group", "potcjap", "potcformo")


###FULL COMPLOT

comp_fullplot<-admix_barplot(
complot_full,
K = 3:ncol(complot_full),
individuals = 1,
sortkey = "potcformo",
grouping = "group",
palette = c("blue","red"),
names = TRUE,
xlab = "Individuals",
ylab = "Ancestry",
main = "Composition Plot (full)",
noclip = FALSE
)

##LESS INDIVIDUALS

comp_parplot<-admix_barplot(
complot_lessind,
K = 3:ncol(complot_lessind),
individuals = 1,
sortkey = "potcformo",
grouping = "group",
palette = c("blue","red"),
names = TRUE,
xlab = "Individuals",
ylab = "Ancestry",
main = "Composition Plot (less than 25% missing data)",
noclip = FALSE
)

###ADMIXTURE PLOTS

fulladmixplot<-admix_barplot(
data_admixture_all,
K = 3:ncol(data_admixture_all),
individuals = 1,
sortkey = "potcformo",
grouping = "group",
palette = c("blue","red"),
names = TRUE,
xlab = "Individuals",
ylab = "Ancestry",
main = "ADMIXTURE Plot (full)",
noclip = FALSE
)

partadmixplot<-admix_barplot(
data_admixture_all_lessthan25,
K = 3:ncol(data_admixture_all_lessthan25),
individuals = 1,
sortkey = "potcformo",
grouping = "group",
palette = c("blue","red"),
names = TRUE,
xlab = "Individuals",
ylab = "Ancestry",
main = "ADMIXTURE Plot (less than 25% missing data)",
noclip = FALSE
)

ggarrange(fulladmixplot, partadmixplot, ncol=1, nrow=2, common.legend = TRUE, legend="bottom")

###SAVE GOOD TABLES

write_csv(complot_full, "complot_data_full.csv")

write_csv(complot_lessind, "complot_25pc_full.csv")

write_csv(data_admixture_all, "data_admixture_full.csv")

write_csv(data_admixture_all_lessthan25, "data_admixture_25pc.csv")
