library(raster)
library(RStoolbox)
setwd("C:/Users/kirir/OneDrive/Desktop/lab")
library(ggplot2)
l92 <- brick("defor1_.jpg")
l06 <- brick("defor2_.jpg")
ggRGB(l92, r=1, g=2, b=3, stretch="lin")
ggRGB(l06, r=1, g=2, b=3, stretch="lin")
library(patchwork)
p1 <- ggRGB(l92, r=1, g=2, b=3, stretch="lin")
p2 <- ggRGB(l06, r=1, g=2, b=3, stretch="lin")
p1+p2
p1/p2
l92c <- unsuperClass(l92, nClasses=2)
l06c <- unsuperClass(l06, nClasses=2)
plot(l92c$map)
plot(l06c$map)
freq(l92c$map)
freq(l06c$map)
l92
l06
tot92 <- 341292
tot06 <- 342726
prop_forest_92 <- 304441 / tot92
prop_forest_06 <- 164660 / tot06
prop_agr_92 <- 1 - prop_forest_92
prop_agr_06 <- 1 - prop_forest_06
perc_forest_92 <- prop_forest_92 * 100
perc_forest_06 <- prop_forest_06 * 100
perc_agr_92 <- prop_agr_92 * 100
perc_agr_06 <- prop_agr_06 * 100
perc_forest_92
perc_agr_92
perc_forest_06
perc_agr_06
class <- c("Forest", "Agricolture")
percent_1992 <- c(89.2025, 10.7975)
percent_2006 <- c(48.04421, 51.95579)
multitemporal <- data.frame(class, percent_1992, percent_2006)
View(multitemporal)
ggplot(multitemporal, aes(x=class, y=percent_1992, color=class)) + geom_bar(stat="identity", fill="white")
ggplot(multitemporal, aes(x=class, y=percent_2006, color=class)) + geom_bar(stat="identity", fill="white")
p3 <- ggplot(multitemporal, aes(x=class, y=percent_1992, color=class)) + geom_bar(stat="identity", fill="white")
p4 <- ggplot(multitemporal, aes(x=class, y=percent_2006, color=class)) + geom_bar(stat="identity", fill="white")
graphic_defor <- (p1 +p2) / (p3 + p4)
graphic_defor
pdf("grapich_defor.pdf")
(p1 +p2) / (p3 + p4)
dev.off()
