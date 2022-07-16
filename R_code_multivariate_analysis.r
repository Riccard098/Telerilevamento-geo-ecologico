
# install.packages
library(raster)
 
# Set workdirectory
setwd("C:/Users/kirir/OneDrive/Desktop/lab")
 
# import
l2011 <- brick("p224r63_2011.grd")
 
# plot
plot(l2011)
 
# https://www.r-graph-gallery.com/42-colors-names.html
cl <- colorRampPalette(c("black", "grey", "light grey")) (100)
plot(l2011, col=cl)
 
# dev.off()
 
