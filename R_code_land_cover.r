# Recall libraries
library(raster)
library(RStoolbox)
library(ggplot2)
library(patchwork)

# Set Workdirectory
setwd("C:/Users/kirir/OneDrive/Desktop/lab")

# Import and rename data
l92 <- brick("defor1_.jpg")
l06 <- brick("defor2_.jpg")

# PlortRGB of data
ggRGB(l92, r=1, g=2, b=3, stretch="lin")
ggRGB(l06, r=1, g=2, b=3, stretch="lin")

# Patch data of different years toghether
p1 <- ggRGB(l92, r=1, g=2, b=3, stretch="lin")
p2 <- ggRGB(l06, r=1, g=2, b=3, stretch="lin")
p1+p2
p1/p2

# Classification of data in two classes
l92c <- unsuperClass(l92, nClasses=2)
l06c <- unsuperClass(l06, nClasses=2)

# Plot of classified data
plot(l92c$map)
plot(l06c$map)

# Frequency of classified data
freq(l92c$map)
freq(l06c$map)
l92
l06

# Calculate the total amount per year
tot92 <- 341292
tot06 <- 342726

# Calculate proportion of forest and agricolture per year
prop_forest_92 <- 304441 / tot92
prop_forest_06 <- 164660 / tot06
prop_agr_92 <- 1 - prop_forest_92
prop_agr_06 <- 1 - prop_forest_06

# Calculate percentage of forest and agricolture per year
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

# Build a dataframe
multitemporal <- data.frame(class, percent_1992, percent_2006)
View(multitemporal)

# Plot and add graphcs
ggplot(multitemporal, aes(x=class, y=percent_1992, color=class)) + geom_bar(stat="identity", fill="white")
ggplot(multitemporal, aes(x=class, y=percent_2006, color=class)) + geom_bar(stat="identity", fill="white")

# Rename ggplots
p3 <- ggplot(multitemporal, aes(x=class, y=percent_1992, color=class)) + geom_bar(stat="identity", fill="white")
p4 <- ggplot(multitemporal, aes(x=class, y=percent_2006, color=class)) + geom_bar(stat="identity", fill="white")

# Plot alltogheter and create a pdf
graphic_defor <- (p1 +p2) / (p3 + p4)
graphic_defor
pdf("grapich_defor.pdf")
(p1 +p2) / (p3 + p4)
dev.off()
