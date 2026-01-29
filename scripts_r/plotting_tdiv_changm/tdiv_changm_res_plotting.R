###PLOTTING THE RESULTS

library(tidyverse)
library(patchwork)

fina_data<-read_csv("fina_data.csv")

tdiv<-fina_data %>% ggplot(mapping=aes(x=VCF,y=CHANGM)) + geom_boxplot() + theme_bw()

changm<-fina_data %>% ggplot(mapping=aes(x=VCF,y=CHANGM)) + geom_boxplot() + theme_bw()

pdf(file="tochange_boxplot.pdf")

tdiv + changm

dev.off()

