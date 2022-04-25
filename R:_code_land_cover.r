library(raster)
library(RStoolbox)
setwd("C:/Users/kirir/OneDrive/Desktop/lab")
library(ggplot2)
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
