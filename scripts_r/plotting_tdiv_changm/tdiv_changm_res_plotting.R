###PLOTTING THE RESULTS

library(tidyverse)
library(patchwork)

fina_data<-read_csv("supfinadata.csv")

tdiv<-fina_data %>% ggplot(mapping=aes(x=SFS,y=TDIV)) + geom_boxplot() + theme_bw()

changm<-fina_data %>% ggplot(mapping=aes(x=SFS,y=CHANGM)) + geom_boxplot() + theme_bw()

pdf(file="tochange_boxplot.pdf")

tdiv + coord_trans(y = "log10") + theme(text = element_text(size=16), title = element_text(size=20)) + changm + coord_trans(y = "log10") + theme(text = element_text(size=16), title = element_text(size=20)) + plot_annotation(tag_levels = 'A')
dev.off()

