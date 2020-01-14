library(ggplot2)
library(plotly)
library(RColorBrewer)
theme_set(theme_bw(16)) 

#ALL malignos
rctm = read.csv("cat_RCTM_M.txt", sep = "\t")
rctm2=rctm %>% group_by(Group) %>% mutate(ratio = count/sum(count))
head(rctm2)
P5 = ggplot(rctm2, aes(rctm2$term, rctm2$ratio, size=rctm2$count, color=rctm2$FDR)) + geom_point() +  coord_flip() + facet_wrap(~ Group)
P5
P5 = P5+scale_color_gradient(low = "red2",  high = "mediumblue", space = "Lab")
P5 + labs(colour = "FDR", x="Pathway", y="GeneRatio", size="Count") + theme(axis.text=element_text(size=8))

#ALL no malignos
rctm3 = read.csv("cat_RCTM_NM.txt", sep = "\t")
rctm4=rctm3 %>% group_by(Group) %>% mutate(ratio = count/sum(count))
head(rctm4)
P6 = ggplot(rctm4, aes(rctm4$term, rctm4$ratio, size=rctm4$count, color=rctm4$FDR)) + geom_point() +  coord_flip() + facet_wrap(~ Group)
P6
P6 = P6+scale_color_gradient(low = "red2",  high = "mediumblue", space = "Lab")
P6 + labs(colour = "FDR", x="Pathway", y="GeneRatio", size="Count") + theme(axis.text=element_text(size=8))
